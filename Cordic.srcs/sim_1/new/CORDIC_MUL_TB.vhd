----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2017 06:21:24 PM
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

entity CORDIC_MUL_TB is
--  Port ( );
end CORDIC_MUL_TB;

architecture tb of CORDIC_MUL_TB is

component CORDIC_MUL
	generic	(
			num_iters : integer := 10; -- Number of iterations
			width : integer := 16 -- Fixed Point Width  
		);
port	(
			i_a, i_b : in std_logic_vector(width-1 downto 0); -- Fixed Point Inputs
			i_start, i_clk : in std_logic;
			o_product : out std_logic_vector(width-1 downto 0); -- Fixed Point Outputs
			o_done : out std_logic
		);
end component;

constant c_clk_per : time := 10ns;
signal s_clk : std_logic := '0';
signal s_a, s_b, s_prod : std_logic_vector(15 downto 0) := (others => '0');
signal s_start, s_done : std_logic := '0';
begin

uut: CORDIC_MUL 
	generic map (
		num_iters => 10,
		width => 16) 
	port map(
		i_a => s_a,
		i_b => s_b,
		i_start => s_start,
		i_clk => s_clk,
		o_product => s_prod,
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
	s_a <= X"199a"; -- 0.2
	s_b <= X"3333"; -- 0.4
	wait for 2*c_clk_per;
	s_start <= '1';
	wait for c_clk_per;
	s_start <= '0';
	wait;
end process;

end tb;
