----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    MLUART_TX - RTL
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

entity MLUART_RX is
port ( CLK_100MHZ         : in std_logic;
       clk_en_16_x_baud   : in std_logic;   
	   read_data          : in std_logic;
	   UART_RX            : in std_logic;
	   outData            : out std_logic_vector(7 downto 0);
	   read_data_complete : out std_logic );

end MLUART_RX;

architecture RTL of MLUART_RX is

type   tstateRX is (idle,readCode, read_start, read_d0, read_d1, read_d2, read_d3, read_d4, read_d5, read_d6, read_d7, read_stop, read_status);
signal sstateRX : tstateRX;
signal outDataSig : std_logic_vector(7 downto 0);
signal scount4  : unsigned (3 downto 0) := (others => '0');

signal sdata_in : std_logic_vector (7 downto 0);

signal sread_start, sread_data, sread_stop, scount : std_logic;

begin

-- State Machine: transitions
process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
	   case sstateRX is
         when idle         => if read_data = '1' then sstateRX <= read_d0;    end if;
         when readCode     => sstateRX <= read_start; 
         when read_start   => if scount = '1'    then sstateRX <= read_d0;     end if;
		 when read_d0      => if scount = '1'    then sstateRX <= read_d1;     end if;		  
		 when read_d1      => if scount = '1'    then sstateRX <= read_d2;     end if;		  
		 when read_d2      => if scount = '1'    then sstateRX <= read_d3;     end if;		  
		 when read_d3      => if scount = '1'    then sstateRX <= read_d4;     end if;		  
		 when read_d4      => if scount = '1'    then sstateRX <= read_d5;     end if;		  
		 when read_d5      => if scount = '1'    then sstateRX <= read_d6;     end if;		  
		 when read_d6      => if scount = '1'    then sstateRX <= read_d7;     end if;		  
		 when read_d7      => if scount = '1'    then sstateRX <= read_stop;   end if;		   
		 when read_stop    => if scount = '1'    then sstateRX <= read_status; end if;
		 when read_status => sstateRX <= idle; 
	   end case;
	 end if;
  end if;
end process;

-- State Machine: explicit outputs

sread_start <= '1' when sstateRX = read_start else '0';
sread_stop  <= '1' when sstateRX = read_stop  else '0';

with sstateRx select 
  sread_data <= '1' when read_d0 | read_d1 | read_d2 | read_d3 | read_d4 | read_d5 | read_d6 | read_d7,
                '0' when others;  

read_data_complete <= '1' when sstateRX = read_status else '0';

-- State Machine

-- Datapath

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then  
      if sread_data = '1' and scount ='1' then 
        outDataSig <= UART_RX & outDataSig(7 downto 1)  ; 
      end if;
    end if;  
  end if;
end process;

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
       if (sread_start = '1' or sread_data = '1' or sread_stop = '1') then 
         scount4 <= scount4 + 1;
       else   
         scount4 <= (others => '0');
       end if;		 	    	
	 end if;
  end if;
end process;


outData <= outDataSig;
scount <= '1' when scount4 = X"F" else '0'; 

end RTL;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    MLUART_TX - RTL
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

entity MLUART_RX is
port ( CLK_100MHZ         : in std_logic;
       clk_en_16_x_baud   : in std_logic;   
	   read_data          : in std_logic;
	   UART_RX            : in std_logic;
	   outData            : out std_logic_vector(7 downto 0);
	   read_data_complete : out std_logic );

end MLUART_RX;

architecture RTL of MLUART_RX is

type   tstateRX is (idle,readCode, read_start, read_d0, read_d1, read_d2, read_d3, read_d4, read_d5, read_d6, read_d7, read_stop, read_status);
signal sstateRX : tstateRX;
signal outDataSig : std_logic_vector(7 downto 0);
signal scount4  : unsigned (3 downto 0) := (others => '0');

signal sdata_in : std_logic_vector (7 downto 0);

signal sread_start, sread_data, sread_stop, scount : std_logic;

begin

-- State Machine: transitions
process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
	   case sstateRX is
         when idle         => if read_data = '1' then sstateRX <= read_d0;    end if;
         when readCode     => sstateRX <= read_start; 
         when read_start   => if scount = '1'    then sstateRX <= read_d0;     end if;
		 when read_d0      => if scount = '1'    then sstateRX <= read_d1;     end if;		  
		 when read_d1      => if scount = '1'    then sstateRX <= read_d2;     end if;		  
		 when read_d2      => if scount = '1'    then sstateRX <= read_d3;     end if;		  
		 when read_d3      => if scount = '1'    then sstateRX <= read_d4;     end if;		  
		 when read_d4      => if scount = '1'    then sstateRX <= read_d5;     end if;		  
		 when read_d5      => if scount = '1'    then sstateRX <= read_d6;     end if;		  
		 when read_d6      => if scount = '1'    then sstateRX <= read_d7;     end if;		  
		 when read_d7      => if scount = '1'    then sstateRX <= read_stop;   end if;		   
		 when read_stop    => if scount = '1'    then sstateRX <= read_status; end if;
		 when read_status => sstateRX <= idle; 
	   end case;
	 end if;
  end if;
end process;

-- State Machine: explicit outputs

sread_start <= '1' when sstateRX = read_start else '0';
sread_stop  <= '1' when sstateRX = read_stop  else '0';

with sstateRx select 
  sread_data <= '1' when read_d0 | read_d1 | read_d2 | read_d3 | read_d4 | read_d5 | read_d6 | read_d7,
                '0' when others;  

read_data_complete <= '1' when sstateRX = read_status else '0';

-- State Machine

-- Datapath

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then  
      if sread_data = '1' and scount ='1' then 
        outDataSig <= UART_RX & outDataSig(7 downto 1)  ; 
      end if;
    end if;  
  end if;
end process;

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
       if (sread_start = '1' or sread_data = '1' or sread_stop = '1') then 
         scount4 <= scount4 + 1;
       else   
         scount4 <= (others => '0');
       end if;		 	    	
	 end if;
  end if;
end process;


outData <= outDataSig;
scount <= '1' when scount4 = X"F" else '0'; 

end RTL;