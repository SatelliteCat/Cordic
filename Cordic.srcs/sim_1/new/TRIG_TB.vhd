----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2017 10:07:05 AM
-- Design Name: 
-- Module Name: TRIG_TB - tb
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

entity TRIG_TB is
--  Port ( );
end TRIG_TB;

architecture tb of TRIG_TB is

component CORDIC_TRIG
	generic	(
			num_iters : integer := 10; -- Number of iterations
			width : integer := 16 -- Fixed Point Width  
		);
port	(
			i_theta : in std_logic_vector(width-1 downto 0); -- Fixed Point Inputs
			i_start, i_clk : in std_logic;
			o_sin, o_cos : out std_logic_vector(width-1 downto 0); -- Fixed Point Outputs
			o_done : out std_logic
		);
end component;

signal s_theta, s_sin, s_cos : std_logic_vector(15 downto 0);
signal s_start, s_clk, s_done : std_logic := '0';

constant c_clk_per : time := 10 ns;
begin

	uut: CORDIC_TRIG port map(
		i_theta => s_theta,
		i_start => s_start,
		i_clk => s_clk,
		o_sin => s_sin,
		o_cos => s_cos,
		o_done => s_done
	);

	clock_stim: process
	begin
		s_clk <= '0';
		wait for c_clk_per/2;
		s_clk <= '1';
		wait for c_clk_per/2;
	end process;

	stim_proc: process
	begin
		s_theta <= X"6488";
		s_start <= '1';
		wait for c_clk_per;
		s_start <= '0';
		wait until s_done = '1';
		wait;
	end process;
end tb;
