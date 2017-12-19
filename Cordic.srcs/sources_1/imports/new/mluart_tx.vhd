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

entity MLUART_TX is
port ( CLK_100MHZ         : in std_logic;
       clk_en_16_x_baud   : in std_logic;   
	   data_in            : in std_logic_vector(7 downto 0);
	   send_data          : in std_logic;
	   UART_TX            : out std_logic;
	   send_data_complete : out std_logic );

end MLUART_TX;

architecture RTL of MLUART_TX is

type   tstateTX is (idle, read_code, send_start, send_d0, send_d1, send_d2, send_d3, send_d4, send_d5, send_d6, send_d7, send_stop, write_status);
signal sstateTX : tstateTX;
signal scount4  : unsigned (3 downto 0) := (others => '0');

signal sdata_in : std_logic_vector (7 downto 0);

signal sread_code, ssend_start, ssend_data, ssend_stop, scount : std_logic;

begin

-- State Machine: transitions
process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
	   case sstateTX is

         when idle      => if send_data = '1' then sstateTX <= read_code; end if;

		 when read_code => sstateTX <= send_start; 
		  
         when send_start    => if scount = '1' then sstateTX <= send_d0; end if;
		 when send_d0       => if scount = '1' then sstateTX <= send_d1; end if;		  
		 when send_d1       => if scount = '1' then sstateTX <= send_d2; end if;		  
		 when send_d2       => if scount = '1' then sstateTX <= send_d3; end if;		  
		 when send_d3       => if scount = '1' then sstateTX <= send_d4; end if;		  
		 when send_d4       => if scount = '1' then sstateTX <= send_d5; end if;		  
		 when send_d5       => if scount = '1' then sstateTX <= send_d6; end if;		  
		 when send_d6       => if scount = '1' then sstateTX <= send_d7; end if;		  
		 when send_d7       => if scount = '1' then sstateTX <= send_stop; end if;		  
		  
		 when send_stop     => if scount = '1' then sstateTX <= write_status; end if;

		 when write_status => sstateTX <= idle; 

	   end case;
	 end if;
  end if;
end process;

-- State Machine: explicit outputs

sread_code  <= '1' when sstateTX = read_code  else '0';
ssend_start <= '1' when sstateTX = send_start else '0';
ssend_stop  <= '1' when sstateTX = send_stop  else '0';

with sstateTx select 
  ssend_data <= '1' when send_d0 | send_d1 | send_d2 | send_d3 | send_d4 | send_d5 | send_d6 | send_d7,
                '0' when others;  

send_data_complete <= '1' when sstateTX = write_status else '0';

-- State Machine

-- Datapath

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
      if sread_code = '1' then
        sdata_in <= data_in;
      end if;  
      if ssend_data = '1' and scount ='1' then 
        sdata_in <= sdata_in(0)&sdata_in(7 downto 1); 
      end if;
    end if;  
  end if;
end process;


process(ssend_start, ssend_data, ssend_stop, sdata_in)
begin
  case std_logic_vector'(ssend_start, ssend_data, ssend_stop) is
     when "100"  => UART_TX <= '0';
	 when "010"  => UART_TX <= sdata_in(0);
	 when "001"  => UART_TX <= '1';
	 when others => UART_TX <= '1';
  end case;	 
end process;

process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
    if clk_en_16_x_baud = '1' then
       if (ssend_start = '1' or ssend_data = '1' or ssend_stop = '1') then 
         scount4 <= scount4 + 1;
       else   
         scount4 <= (others => '0');
       end if;		 	    	
	 end if;
  end if;
end process;

scount <= '1' when scount4 = X"F" else '0'; 

end RTL;