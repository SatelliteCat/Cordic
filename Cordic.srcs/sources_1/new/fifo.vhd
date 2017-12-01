----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2017 12:15:00 AM
-- Design Name: 
-- Module Name: fifo - rtl
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

entity fifo is
    generic (   depth : integer := 3; -- log2 number of entries
                width : integer := 8 -- width of data
    );
    port    (   clk     : in std_logic;
                rst     : in std_logic;
                wr      : in std_logic;
                rd      : in std_logic;
                d_in    : in std_logic_vector(width - 1 downto 0);
                f_full  : out std_logic;
                f_empty : out std_logic;
                d_out   : out std_logic_vector(width - 1 downto 0)
    );          
end fifo;

architecture rtl of fifo is
type FIFO is array(0 to 2**(depth) - 1) of std_logic_vector(width - 1 downto 0);
signal s_FIFO : FIFO := (others => (others => '0'));
signal s_readPtr, s_writePtr : unsigned(depth - 1 downto 0) := (others => '0'); 
signal s_count: unsigned(depth downto 0) := (others => '0');
constant c_max : integer := 2**(depth);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                s_readPtr <= (others => '0');
                s_writePtr <= (others => '0');
                s_count <= (others => '0');
            else
                if wr = '1' then
                	if not (to_integer(s_count) = c_max) then
						s_FIFO(to_integer(s_writePtr)) <= d_in;
						s_writePtr <= s_writePtr + 1;
						s_count <= s_count + 1;
					end if;
                end if;
                if rd = '1' then
                    if not (to_integer(s_count) = 0) then
                        d_out <= s_FIFO(to_integer(s_readPtr));
                        s_readPtr <= s_readPtr + 1;
                        s_count <= s_count - 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

	f_empty <= '1' when to_integer(s_count) = 0 else '0';
	f_full <= '1' when to_integer(s_count) = c_max else '0';

end rtl;
