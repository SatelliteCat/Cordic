----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2017 12:21:55 PM
-- Design Name: 
-- Module Name: FIFO - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO is
generic (
depth : integer := 256;
width : integer  := 8
);
port (
clk : in std_logic;
rst : in std_logic;
wr : in std_logic;
rd : in std_logic;
d_in : in std_logic_vector (width-1 downto 0);
f_full : out std_logic;
f_empty : out std_logic;
d_out : out std_logic_vector (width-1 downto 0)
);
end FIFO;

architecture Behavioral of FIFO is
-- Signal assignment


signal rdwr_Comp          : std_logic;
signal looped             : std_logic := '0';
type fstateX is(idle,rd_wr);
signal sstate             : fstateX;
begin

--Case Transition
process(clk)
    begin
    if(clk'event and clk = '1') then
        if(rst = '1') then
            sstate<=idle;
        end if;
        case(sstate) is
            when idle => 
                if(wr = '1' or rd ='1') then
                    sstate<= rd_wr;
                end if;
            when rd_wr =>sstate<=idle; 
        end case;
     end if;
end process;

--Output
process(clk)
    type fifoStruct           is array (0 to depth-1) of std_logic_vector(width-1 downto 0);
    variable fifo             : fifoStruct;
    variable wPointer, rPointer : integer := 0;
begin
   
if(clk'event and clk = '1') then
    if (sstate = idle) then
        rdwr_Comp <= '0';
        if(rPointer = depth-1) then
            rPointer := 0;
            looped <= not looped;
        end if;
        if(wPointer = depth-1) then
            wPointer := 0;
            looped <= not looped;
        end if;
        if(wPointer = rPointer) then
            if (looped = '1') then
                f_full <= '1';
            else 
                f_empty <= '1';
            end if;
       else f_full <= '0'; f_empty <= '0';
       end if;
    elsif (sstate = rd_wr) then
        if (rd = '1') then
            if(looped = '1' or wPointer/= rPointer) then
            d_out <= fifo(rPointer);
            rPointer := rPointer + 1;
            
            end if;
        end if;
        if (wr = '1') then
            if(looped = '0' or wPointer/= rPointer) then
            fifo(wPointer) := d_in;
            wPointer := wPointer + 1;
            
            end if;
        end if;
    end if; 
end if;           
end process;


end Behavioral;