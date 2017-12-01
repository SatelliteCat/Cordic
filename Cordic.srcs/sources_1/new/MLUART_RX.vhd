----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Liam Kalir
-- 
-- Create Date: 10/10/2017 07:26:35 PM
-- Design Name: MLUART_RX.vhd
-- Module Name: MLUART_RX - RTL
-- Project Name: Lab 3: UART Serial Communication & FPGA Coporcessor
-- Target Devices: Nexys4 DDR
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

entity MLUART_RX is
    port(   CLK_100MHZ          : in std_logic;
            clk_en_16_x_baud    : in std_logic;
            UART_RX             : in std_logic;
            data_out            : out std_logic_vector(7 downto 0);
            done_read           : out std_logic
        );
end MLUART_RX;

architecture RTL of MLUART_RX is
type readstate is (idle, start, data, stop, status);
signal s_cs : readstate := idle;
signal s_counter : unsigned(3 downto 0) := (others => '0');
signal s_sample : std_logic := '0';
signal s_sreg : std_logic_vector(7 downto 0) := (others => '0');
signal s_samplecount : unsigned(2 downto 0) := (others => '0');

begin

    process(CLK_100MHZ)
    begin
        if rising_edge(CLK_100MHZ) then
            if clk_en_16_x_baud = '1' then
                case s_cs is
                    when data to stop =>    if s_counter = X"F" then
                                        s_counter <= (others => '0');
                                        s_sample <= '1';
                                    else
                                        s_counter <= s_counter + 1;
                                        s_sample <= '0';
                                    end if;
                    when others =>  s_counter <= (others => '0');
                                    s_sample <= '0';
                end case;
            end if;
        end if;
    end process;
    
    process(CLK_100MHZ)
    begin
        if rising_edge(CLK_100MHZ) then
            if clk_en_16_x_baud = '1' then
                case s_cs is
                    when idle =>    if UART_RX = '0' then 
                                        s_cs <= start; 
                                    else 
                                        s_cs <= idle;
                                    end if;
                                    done_read <= '0';
                    when start =>   s_cs <= data;
                                    done_read <= '0';
                    when data =>    if s_sample = '1' then
                                        s_sreg <= UART_RX & s_sreg(7 downto 1);
                                        s_samplecount <= s_samplecount + 1;
                                        if s_samplecount = X"7" then
                                            s_samplecount <= (others => '0');
                                            s_cs<= stop;
                                        else
                                            s_cs <= data;
                                        end if;
                                    end if;
                                    done_read <= '0';
                    when stop =>    if s_sample = '1' then
                                        if UART_RX = '1' then
                                            s_cs <= status;
                                        else
                                            s_cs <= stop;
                                        end if;
                                    end if;
                                    done_read <= '0';
                    when status =>  data_out <= s_sreg;
                                    done_read <= '1';
                                    s_cs <= idle;
                end case;
            end if;
        end if;
    end process;

end RTL;
