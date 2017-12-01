----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Liam Kalir
-- 
-- Create Date:    
-- Design Name: 
-- Module Name:    UART - RTL
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
use  IEEE.NUMERIC_STD.ALL;

entity UART_CORDIC is
	port	(	CLK_100MHZ : in  std_logic; -- Main FPGA clock
				UART_RX    : in  std_logic;
				UART_TX	   : out std_logic; -- UART TX (transmit)
				LEDS       : out std_logic_vector (7 downto 0) -- Display the code
			);
end UART_CORDIC;

architecture RTL of UART_CORDIC is
 
component MLUART_TX 
	port	(	CLK_100MHZ         : in std_logic;
       			clk_en_16_x_baud   : in std_logic;   
	   			data_in            : in std_logic_vector(7 downto 0);
	   			send_data          : in std_logic;
	   			UART_TX            : out std_logic;
	   			send_data_complete : out std_logic
	   		);
end component;

component MLUART_RX
    port	(	CLK_100MHZ          : in std_logic;
            	clk_en_16_x_baud    : in std_logic;
            	UART_RX             : in std_logic;
            	data_out            : out std_logic_vector(7 downto 0);
            	done_read           : out std_logic
    		);
end component;

component	Bin2ASCII	IS
	PORT	(	clka	: IN STD_LOGIC;
				wea		: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
				addra	: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				dina	: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				douta	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END	component;

component fifo
	generic (	depth : integer; -- log2 number of entries
				width : integer -- width of pointers
			);
	port	(	clk     : in std_logic;
				rst     : in std_logic;
				wr      : in std_logic;
				rd      : in std_logic;
				d_in    : in std_logic_vector(width - 1 downto 0);
				f_full  : out std_logic;
				f_empty : out std_logic;
				d_out   : out std_logic_vector(width - 1 downto 0)
			);
end component;

signal scount12 : unsigned (11 downto 0) := (others => '0');
signal sclk_en_16_x_baud : std_logic := '0';

signal send_data, send_data_complete, s_recv_complete : std_logic;
signal s_recv : std_logic_vector(7 downto 0);
signal s_regA, s_regB : unsigned(7 downto 0); 
signal s_regC : unsigned(15 downto 0);
signal s_regC_tx : std_logic_vector(15 downto 0);
signal s_tx_buff : std_logic_vector(7 downto 0);

signal s_rx_we, s_rx_re, s_rx_full, s_rx_empty : std_logic;
signal s_tx_we, s_tx_re, s_tx_full, s_tx_empty : std_logic;

signal s_rx_out, s_tx_out : std_logic_vector(7 downto 0);

type t_curInstr is (storeA, storeB, add, sub, mul, tx);
signal s_ci : t_curInstr;

-- top level state machine to start a single transmission
type   tstates is(idle, instruction, recv2, store, math, tx1, tx2, wait_tx1, wait_tx2);
signal sstate : tstates := idle;

type fifo_control is (idle, rw, fifo_wait);
type fifo_control2 is (idle, rw, fifo_wait, fifo_wait2);
signal s_rx_fifo_wr_state, s_rx_fifo_rd_state, s_tx_fifo_wr_state : fifo_control := idle;
signal s_tx_fifo_rd_state : fifo_control2 := idle;

begin 

-- State Machine
process(CLK_100MHZ)
begin
	if CLK_100MHZ'event and CLK_100MHZ = '1' then
		if sclk_en_16_x_baud = '1' then
			case sstate is
				when idle        	=>  if s_rx_empty = '0' then sstate <= instruction; end if;
				when instruction	=>  case s_rx_out is
											when X"61"	=>	s_ci <= storeA; -- About to receive register A
															sstate <= recv2;
											when X"62" 	=>	s_ci <= storeB; -- About to receive register B
															sstate <= recv2;
											when X"2B" 	=>	s_ci <= add; -- Perform add
															sstate <= math;
											when X"2D" 	=>	s_ci <= sub; -- Perform sub
															sstate <= math;
											when X"2A" 	=>	s_ci <= mul; -- Perform mul
															sstate <= math;
											when X"3D" 	=>	s_ci <= tx; -- Transmit C
															sstate <= wait_tx1;
											when others =>  sstate <= idle; -- Protocol violation, go back to start
										end case;
				when recv2       	=>	if s_rx_empty = '0' then sstate <= store; end if;
				when store       	=>	if s_rx_fifo_rd_state = fifo_wait then
											case s_ci is
												when storeA	=>	s_regA <= unsigned(s_rx_out) - 48;
												when storeB	=>	s_regB <= unsigned(s_rx_out) - 48;
												when others	=>	null; -- Should not reach this state
											end case;
											sstate <= idle;
										end if;
				when math        	=>	case s_ci is
											when add	=>	s_regC <= to_unsigned(to_integer(s_regA) + to_integer(s_regB), 16);
											when sub	=>	s_regC <= to_unsigned(to_integer(s_regA) - to_integer(s_regB), 16);
											when mul	=>	s_regC <= to_unsigned(to_integer(s_regA) * to_integer(s_regB), 16);
											when others	=>	null; -- Should not reach this state
										end case;
										sstate <= idle;
				when wait_tx1   	=>	s_tx_buff <= s_regC_tx(15 downto 8);
										sstate <= tx1;
				when tx1        	=>	if s_tx_full = '0' then sstate <= wait_tx2; end if;
				when wait_tx2   	=>	s_tx_buff <= s_regC_tx(7 downto 0);
										sstate <= tx2;
				when tx2        	=>	if s_tx_full = '0' then sstate <= idle; end if;
			end case;
		end if;
	end if;
end process;

-- RX FIFO control state machine
process(CLK_100MHZ)
begin
	if rising_edge(CLK_100MHZ) then
		case s_rx_fifo_wr_state is
			when idle		=>	if s_recv_complete = '1' then
									s_rx_fifo_wr_state <= rw;
								end if;
			when rw			=>	s_rx_fifo_wr_state <= fifo_wait;
			when fifo_wait	=>	if s_recv_complete = '0' then
									s_rx_fifo_wr_state <= idle;
								end if;
		end case;
		case s_rx_fifo_rd_state is
			when idle		=>	if (sstate = instruction or sstate = recv2 or sstate = store) then
									s_rx_fifo_rd_state <= rw;
								end if;
			when rw			=>	s_rx_fifo_rd_state <= fifo_wait;
			when fifo_wait	=>	if not (sstate = instruction or sstate = recv2) then
									s_rx_fifo_rd_state <= idle;
								end if;
		end case;
	end if;
end process;

process(CLK_100MHZ)
begin
	if rising_edge(CLK_100MHZ) then
		case s_tx_fifo_rd_state is
			when idle		=>	if s_tx_empty = '0' then
									s_tx_fifo_rd_state <= rw;
								end if;
			when rw			=>	s_tx_fifo_rd_state <= fifo_wait;
			when fifo_wait	=>	if send_data_complete = '1' then
									s_tx_fifo_rd_state <= fifo_wait2;
								end if;
			when fifo_wait2 =>  if send_data_complete = '0' then
			                        s_tx_fifo_rd_state <= idle;
			                    end if;
		end case;
		case s_tx_fifo_wr_state is
			when idle		=>	if (sstate = tx1 or sstate = tx2) then
									s_tx_fifo_wr_state <= rw;
								end if;
			when rw			=>	s_tx_fifo_wr_state <= fifo_wait;
			when fifo_wait	=>	if not (sstate = tx1 or sstate = tx2) then
									s_tx_fifo_wr_state <= idle;
								end if;
		end case;
	end if;
end process;

-- RX FIFO write control
process(s_rx_fifo_wr_state)
begin
	case s_rx_fifo_wr_state is
		when rw		=>	s_rx_we <= '1';
		when others	=>	s_rx_we <= '0';
	end case;
end process;

-- RX FIFO read control
process(s_rx_fifo_rd_state)
begin
	case s_rx_fifo_rd_state is
		when rw		=>	s_rx_re <= '1';
		when others	=>	s_rx_re <= '0';
	end case;
end process;

-- TX FIFO read control
process(s_tx_fifo_rd_state)
begin
	case s_tx_fifo_rd_state is
		when rw		=>	s_tx_re <= '1';
		                send_data <= '1';
	    when fifo_wait  => s_tx_re <= '0';
	                       send_data <= '1';
		when others	=>	s_tx_re <= '0';
		                send_data <= '0';
	end case;
end process;

-- TX FIFO write control
process(s_tx_fifo_wr_state)
begin
	case s_tx_fifo_wr_state is
		when rw		=>	s_tx_we <= '1';
		when others	=>	s_tx_we <= '0';
	end case;
end process;

MLUART_TX_INSTANCE_01:
MLUART_TX port map
	(	CLK_100MHZ			=> CLK_100MHZ,
       	clk_en_16_x_baud	=> sclk_en_16_x_baud,   
	   	data_in            	=> s_tx_out,
	   	send_data          	=> send_data,
	   	UART_TX            	=> UART_TX,
	   	send_data_complete	=> send_data_complete);

MLUART_RX_INSTANCE_01:
MLUART_RX port map
    (   CLK_100MHZ          => CLK_100MHZ,
        clk_en_16_x_baud    => sclk_en_16_x_baud,
        UART_RX             => UART_RX,
        data_out            => s_recv,
        done_read           => s_recv_complete);
        
BIN2A_MEM_INSTANCE_01:
Bin2ASCII port map
    (   clka            => CLK_100MHZ,
        wea(0 downto 0) => "0",
        addra           => std_logic_vector(s_regC(7 downto 0)),
        dina            => X"0000",
        douta           => s_regC_tx);
        
RX_FIFO:
fifo generic map
    (   depth => 9,
        width => 8)
    port map
    (   clk => CLK_100MHZ,
        rst => '0',
        wr => s_rx_we,
        rd => s_rx_re,
        d_in => s_recv,
        f_full => s_rx_full,
        f_empty => s_rx_empty,
        d_out => s_rx_out);

TX_FIFO:
fifo generic map
    (   depth => 10,
        width => 8)
    port map
    (   clk => CLK_100MHZ,
        rst => '0',
        wr => s_tx_we,
        rd => s_tx_re,
        d_in => s_tx_buff,
        f_full => s_tx_full,
        f_empty => s_tx_empty,
        d_out => s_tx_out);
        
LEDS <= s_recv(7 downto 0);

-- clock enable according to the required baud value
process(CLK_100MHZ)
begin
  if CLK_100MHZ'event and CLK_100MHZ = '1' then
 -- if scount = X"28B" then           ----  for    9600 baud : 100 MHZ / (16 * 9600)   = 651 => 0x28B / 
    if scount12 = X"36" then          ----  for  115200 baud : 100 MHZ / (16 * 115200) =  54 => 0x 36 / 
	  scount12 <= (others => '0');
	else
	  scount12 <= scount12 + 1;
	end if;
  end if;  
end process;

sclk_en_16_x_baud <= '1' when scount12 = X"36" else '0'; 

end RTL;
