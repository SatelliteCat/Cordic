----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2017 11:43:18 AM
-- Design Name: 
-- Module Name: sRAM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sRAM is
generic(
      addrSize : INTEGER;
      dataSize : INTEGER;
      size     : INTEGER
      );
Port ( 
     addr : in std_logic_vector(addrSize-1 downto 0);
     WE,CE,OE : in std_logic;
     data_In : in std_logic_vector(dataSize-1 downto 0);
     data_out : out std_logic_vector(dataSize-1 downto 0)
     );
end sRAM;

architecture Behavioral of sRAM is
-- Read Timing Parameters
constant tAA    : time := 70 ns;  --Address access time
constant tOE    : time := 20 ns;  --Output enable to valid output
constant tOHZ    : time := 8 ns;  --Output disable to DQ High-Z output                                 
constant tRC    : time := 210 ns; --Read cycle time


--Write Timing Parameters
constant tDW    : time := 20 ns;  --Data WRITE setup time
constant tDH    : time := 0 ns;   --Data HOLD setup time
constant tAW    : time := 70 ns;  --Address valid to end of write
constant tWPH    : time := 10 ns; --WRITE pulse width HIGH
constant tWP    : time := 45 ns;  --WRITE pulse width
constant tWC    : time := 260 ns; --WRITE cycle time

--Structure
type arr is array(0 to size) of std_logic_vector(addrSize-1 downto 0);
signal sRAM : arr := (others=>(others=>'0'));


begin
    
 read_Write: process
  begin
    -- read
    if OE'event then
        if OE='0' then
            if CE = '0' and WE ='1' then
                data_out <= transport sram(to_integer(unsigned(addr))) after tOE;
             end if;
        end if;
    else
        data_out<= transport (others =>'Z') after tOHZ;
     end if;
     
     if addr'event and CE='0' and WE='1' and OE='0' then
        data_out <= transport sram(to_integer(unsigned(addr))) after tAA;
     end if;
     
     -- Write
     if (rising_edge(WE) and CE'delayed = '0')
        or (rising_edge(CE) and WE'delayed = '0') then
        sram(to_integer(unsigned(addr))) <= data_in;
     end if;
     
     wait on CE,WE,OE,addr;        
            
 end process;


end Behavioral;
