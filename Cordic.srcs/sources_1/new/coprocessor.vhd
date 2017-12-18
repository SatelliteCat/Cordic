----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2017 09:54:20 AM
-- Design Name: 
-- Module Name: coprocessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use  IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity coprocessor is
    generic ( waitVal : integer:= 50;
             addrSize : integer:=8     );
    Port ( clk : in STD_LOGIC;
           sRamIn : in std_logic_vector(7 downto 0);
           read  : in STD_LOGIC;
           write : in std_logic;
           addr  : in std_logic_vector(addrSize - 1 downto 0);
           sRamOut: out std_logic_vector(7 downto 0);
           done   : out std_logic);   
end coprocessor;

architecture Behavioral of coprocessor is

--Type Declaration
type sstates is (idle, read_State, read_Wait, write_State, write_Wait, post_Wait,wait1);

--Signal Declaration
signal we,ce,oe :  std_logic; --sRam control signals
signal d_i : std_logic_vector(7 downto 0);
signal d_o : std_logic_vector(7 downto 0);
signal procStates : sstates;
signal waitCounter : integer;

--Component Declaration
component sRAM
generic(
    addrSize : INTEGER;
    dataSize : INTEGER;
    size : Integer);
port(
     addr : in std_logic_vector(addrSize-1 downto 0);
     WE,CE,OE : in std_logic;
     data_In : in std_logic_vector(dataSize-1 downto 0);
     data_out : out std_logic_vector(dataSize-1 downto 0)
     );    
end component; 

begin

d_i <= sRamIn;
sRamOut <= d_o;
--State Transition Process
process(clk)
begin
    if clk'event and rising_edge(clk) then
        case(procStates) is
            when idle => if read = '1' then procStates <= read_State; 
                        elsif write = '1' then procStates <= write_State; end if;
            when read_State => procStates <= read_Wait;
            when write_State => procStates <= write_Wait;
            when read_Wait => if(waitCounter = waitVal) then procStates <= post_Wait; end if;
            when write_Wait =>if(waitCounter = waitVal) then procStates <= post_Wait; end if;
            when post_Wait => procStates <= wait1;
            when wait1 => procStates <= idle;
        end case;
    end if;
end process;

--Control Signal Assignment
process(clk)
begin
    if clk'event and rising_edge(clk) then
        case(procStates) is
           when idle =>
                       ce <= '1';
                       we <= '1';
                       oe <= '1';
                       done <= '0';
           when read_State =>
                       ce <= '0';
                       we <= '1';
                       oe <= '0';
           when write_State =>
                       ce <= '0';
                       oe <= '1';
                       we <= '0';
           when post_Wait =>
                       ce <= '1';
                       oe <= '1';
                       we <= '1';
                       done <= '1';
           when others => ce<= ce;
                          oe<=oe;
                          we <= we;
        end case;
    end if;
end process;

--Counter Process
process(clk)
begin      
    if clk'event and rising_edge(clk) then
        if (procStates = read_Wait or procStates = write_Wait) then
            waitCounter <= waitCounter + 1;
        else
            waitCounter <= 0;
        end if;
    end if;
end process;
 
-- sRam mapping
SRAM_MODEL : sRAM
generic map(
    addrSize => 8,
    dataSize => 8,
    size => 256
    )
port map(
    addr => addr,
    WE => we,
    CE => ce,
    OE => oe,
    data_In => d_i,
    data_Out => d_o
    );
end Behavioral;
