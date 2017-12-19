----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: CORDIC_TRIG - rtl
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

entity CORDIC_TRIG is
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
end CORDIC_TRIG;

architecture rtl of CORDIC_TRIG is

type trig_states is (idle, work, swait);
signal sstate : trig_states := idle;
signal s_x_current, s_y_current, s_theta_current : signed(width-1 downto 0) := (others => '0');
signal s_working, s_done : std_logic := '0';
signal s_counter : integer := 0;
signal s_addr : std_logic_vector(3 downto 0) := (others => '0');
signal s_coef : std_logic_vector(15 downto 0) := (others => '0');

COMPONENT TRIG_LUT
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
constant c_K : integer := 9949;

begin

s_addr <= std_logic_vector(to_unsigned(s_counter, 4));

your_instance_name : TRIG_LUT
  PORT MAP (
    clka => i_clk,
    wea => "0",
    addra => s_addr,
    dina => X"0000",
    douta => s_coef
  );

process(i_clk)
variable y_temp : signed(width-1 downto 0);
variable x_temp : signed(width-1 downto 0);
begin
	if rising_edge(i_clk) then
		case sstate is
		when idle =>
			if i_start = '1' then
				sstate <= work;
				s_x_current <= (width-2 => '1', others => '0');
				s_y_current <= (others => '0');
				s_theta_current <= signed(i_theta);
				s_counter <= 0;
			end if;
			s_done <= '0';
		when work =>
			y_temp := (others => '0');
			y_temp(width-1-s_counter downto 0) := s_y_current(width-1 downto s_counter);
			x_temp := (others => '0');
			x_temp(width-1-s_counter downto 0) := s_x_current(width-1 downto s_counter);
			if s_theta_current(width-1) = '0' then
				s_x_current <= to_signed(to_integer(s_x_current) - to_integer(y_temp), 16);
				s_y_current <= to_signed(to_integer(s_y_current) + to_integer(x_temp), 16);
				s_theta_current <= to_signed(to_integer(s_theta_current) - to_integer(unsigned(s_coef)), 16);
			else
				s_x_current <= to_signed(to_integer(s_x_current) + to_integer(y_temp), 16);
				s_y_current <= to_signed(to_integer(s_y_current) - to_integer(x_temp), 16);
				s_theta_current <= to_signed(to_integer(s_theta_current) + to_integer(unsigned(s_coef)), 16);
			end if;
			if s_counter = num_iters-1 then
				sstate <= swait;
			end if;
			s_counter <= s_counter + 1;
			s_done <= '0';
		when swait =>
			s_x_current <= to_signed(to_integer(s_x_current) * c_K, 16);-- - X"2000";
			s_y_current <= to_signed(to_integer(s_y_current) * c_K, 16);-- - X"2000";
			if i_start = '0' then
				sstate <= idle;
			end if;
			s_done <= '1';
		end case;
	end if;
end process;

o_done <= s_done;
o_cos <= std_logic_vector(s_x_current);
o_sin <= std_logic_vector(s_y_current);
end rtl;
