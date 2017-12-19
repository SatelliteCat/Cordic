----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    UART - TB
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
use  IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_textio.all;
use STD.textio.all;

ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT top
    PORT(
         CLK_100MHZ : in  std_logic;
         UART_RX    : in  std_logic;
         UART_TX    : out  std_logic;
         rst        : in   std_logic;
         LEDS       : out  std_logic_vector(7 downto 0);
         SWITCHES	: in std_logic_vector(1 downto 0)
        );
    END COMPONENT;
       
   --Inputs
   signal CLK_100MHZ : std_logic := '0';
   signal UART_RX : std_logic := '1';
   signal rst     : std_logic := '1';
 	--Outputs
   signal UART_TX : std_logic;
   signal LEDS : std_logic_vector(7 downto 0);
   signal SWITCHES : std_logic_vector(1 downto 0);
   
   -- Clock period definitions
   constant CLK_100MHZ_period : time := 10 ns;

    -- UART Procedure
    procedure send_UART(
        signal uart_in      : out std_logic;
        constant clk_period : time;
        variable data_in      : in std_logic_vector(7 downto 0) )is
        begin
            wait for clk_period*10;
            uart_in   <= '0';
            for i in 0 to 7 loop
                wait for clk_period*16*54;
                uart_in   <= data_in(i);
            end loop;
            wait for clk_period*16*54;
            uart_in <= '1';
            wait for 100 us;
    end send_UART;
    
    --PGM variables
    shared variable maxRow      : integer := 5;
    shared variable maxCol      : integer := 7;
    type image is array(0 to maxRow-1, 0 to maxCol-1) of std_logic_vector(7 downto 0);
    shared variable out_image,in_image     : image;
    shared variable line1,line2,line3,line4 : line;
    
    --Control signals
    signal read_Pgm,write_Pgm,read_Done,write_Done    : std_logic:='0';
    
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          CLK_100MHZ => CLK_100MHZ,
          UART_RX => UART_RX,
          UART_TX => UART_TX,
          rst => rst,
          LEDS => LEDS,
          SWITCHES => SWITCHES
        );

   -- Clock process definitions
   CLK_100MHZ_process :process
   begin
		CLK_100MHZ <= '0';
		wait for CLK_100MHZ_period/2;
		CLK_100MHZ <= '1';
		wait for CLK_100MHZ_period/2;
   end process;
   
   process
   variable sendo : std_logic_vector(7 downto 0);
   begin
   		SWITCHES <= "10";
  		sendo := x"01";
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		sendo := x"64";
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		sendo := x"88";
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		sendo := x"00";
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		
--  		sendo := x"9a";
--  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
--  		sendo := x"33";
--  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
--  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		sendo := x"02";
  		send_UART(UART_RX, CLK_100MHZ_period, sendo);
  		wait;
   end process;
end behavior;
