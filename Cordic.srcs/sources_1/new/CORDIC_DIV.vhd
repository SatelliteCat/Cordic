----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: CORDIC_MUL - rtl
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

entity CORDIC_DIV is
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
end CORDIC_DIV;

architecture rtl of CORDIC_DIV is

signal s_a_current, s_b_current, s_quotient_current : unsigned(width-1 downto 0) := (others => '0');
signal s_working : std_logic := '0';
signal s_counter : integer := 0;
signal s_shift : unsigned(width-1 downto 0) := (width-2 => '1', others => '0');

begin

process(i_clk)
begin
	if rising_edge(i_clk) then
		if s_working = '0' then
			if i_start = '1' then
				s_working <= '1';
				s_a_current <= unsigned(i_a);
				s_b_current <= unsigned('0' & i_b(width-1 downto 1));
				s_quotient_current <= (others => '0');
				s_shift <= (width-2 => '1', others => '0');
				s_counter <= 0;
			end if;
		else
			if s_a_current(width-1) = '1' then
				s_a_current <= s_a_current + s_b_current;
				s_quotient_current <= s_quotient_current - s_shift;
			else
				s_a_current <= s_a_current - s_b_current;
				s_quotient_current <= s_quotient_current + s_shift;
			end if;
			s_shift <= '0' & s_shift(width-1 downto 1);
			s_b_current <= '0' & s_b_current(width-1 downto 1);
			if s_counter = num_iters-1 then
				s_working <= '0';
			end if;
			s_counter <= s_counter + 1;
		end if;
	end if;
end process;

o_done <= not s_working;
o_quotient <= std_logic_vector(s_quotient_current);

end rtl;