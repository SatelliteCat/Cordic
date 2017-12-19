----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2017 09:54:20 AM
-- Design Name: 
-- Module Name: coprocessor - Behavioral
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
use  IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity coprocessor is
    Port ( clk : in STD_LOGIC;
    	   in1,in2 : in std_logic_vector(15 downto 0);
    	   output1    : out std_logic_vector(15 downto 0);
  		   output2    : out std_logic_vector(15 downto 0);
    	   start : in std_logic;
           done :  out std_logic;
           SWITCHES : in std_logic_vector(1 downto 0));
end coprocessor;

architecture Behavioral of coprocessor is

--Type Declaration
type sstates is (idle, read_State, read_Wait, write_State, write_Wait, post_Wait,wait1);

--Signal Declaration
signal outMul,outDiv, outSin, outCos : std_logic_vector (15 downto 0);
signal o_Mul_Done, o_Div_Done, o_Trig_Done : std_logic;

--Component Declaration
component CORDIC_MUL is
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

component CORDIC_DIV is
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
component CORDIC_TRIG is
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
begin

process(clk)
 begin
 	if(clk = '1' and clk'event) then
 		if(o_Div_Done = '1' and o_Mul_Done = '1') then
 			case(SWITCHES) is
 				when "00" => output1 <= outMul; output2 <= (others => '0');
 				when "01" => output1 <= outDiv; output2 <= (others => '0');
 				when "10" => output1 <= outSin; output2 <= outCos;
 				when others => output1 <= (others => '0'); output2 <= (others => '0');
 			end case;
 			done <= '1';
 		else
 			done <= '0';
 		end if;
 	end if;
 end process;

CORDIC_MUL_INST:CORDIC_MUL
port map(
		i_a => in1,
		i_b => in2,
		i_start => start,
		i_clk => clk,
		o_product => outMul,
		o_done => o_Mul_Done);
CORDIC_DIV_INST:CORDIC_DIV
port map(
		i_a => in1,
		i_b => in2,
		i_start => start,
		i_clk => clk,
		o_quotient => outDiv,
		o_done => o_Div_Done);
CORDIC_TRIG_INST: CORDIC_TRIG
port map(
	i_theta => in1,
	i_start => start,
	i_clk => clk,
	o_done => o_Trig_Done,
	o_sin => outSin,
	o_cos => outCos
);
	
end Behavioral;


