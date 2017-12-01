----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: CORDIC_MUL_TB - tb
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

entity CORDIC_DIV_TB is
--  Port ( );
end CORDIC_DIV_TB;

architecture tb of CORDIC_DIV_TB is

component CORDIC_DIV
	generic	(
			num_iters : integer := 10; -- Number of iterations
			width : integer := 16 -- Fixed Point Width  
		);
port	(
			i_a, i_b : in std_logic_vector(width-1 downto 0); -- Fixed Point Inputs
			i_start, i_clk : in std_logic;
			o_quotient : out std_logic_vector(width-1 downto 0); -- Fixed Point Outputs
			o_done : out std_logic
		);
end component;

constant c_clk_per : time := 10ns;
signal s_clk : std_logic := '0';
signal s_a, s_b, s_quotient : std_logic_vector(15 downto 0) := (others => '0');
signal s_start, s_done : std_logic := '0';
begin

uut: CORDIC_DIV
	generic map (
		num_iters => 9,
		width => 16) 
	port map(
		i_a => s_a,
		i_b => s_b,
		i_start => s_start,
		i_clk => s_clk,
		o_quotient => s_quotient,
		o_done => s_done);

clk_stim: process
begin
	s_clk <= '0';
	wait for c_clk_per/2;
	s_clk <= '1';
	wait for c_clk_per/2;
end process;

stim_proc: process
begin
	s_a <= X"1733"; -- 11.6
	s_b <= X"64e6"; -- 50.45
	wait for 2*c_clk_per;
	s_start <= '1';
	wait for c_clk_per;
	s_start <= '0';
	wait;
end process;

end tb;
