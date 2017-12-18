----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2017 06:50:37 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
port(
		CLK_100MHZ : in  std_logic;	                     -- Main FPGA clock
		UART_RX    : in  std_logic;                      -- UART RX (recieve)
		rst        : in std_logic;
		UART_TX	   : out std_logic;	                     -- UART TX (transmit) 
		LEDS       : out std_logic_vector (15 downto 0)   -- Display the code  
	);
end top;

architecture Behavioral of top is

 
component MLUART_TX 
port ( CLK_100MHZ         : in std_logic;
       clk_en_16_x_baud   : in std_logic;   
	   data_in            : in std_logic_vector(7 downto 0);
	   send_data          : in std_logic;
	   UART_TX            : out std_logic;
	   send_data_complete : out std_logic );
end component;

component MLUART_RX
port ( CLK_100MHZ         : in std_logic;
       clk_en_16_x_baud   : in std_logic;   
	   read_data          : in std_logic;
	   UART_RX            : in std_logic;
	   outData            : out std_logic_vector(7 downto 0);
	   read_data_complete : out std_logic);
end component;

component FIFO
generic (
depth : integer;
width : integer
);
port (
clk : in std_logic;
rst : in std_logic;
wr : in std_logic;
rd : in std_logic;
d_in : in std_logic_vector (width-1 downto 0);
f_full : out std_logic;
f_empty : out std_logic;
d_out : out std_logic_vector (width-1 downto 0)
);
end component;

component coprocessor
generic ( waitVal : integer:= 50;
         addrSize : integer:=8     );
Port ( clk : in STD_LOGIC;
       sRamIn : in std_logic_vector(7 downto 0);
       read  : in STD_LOGIC;
       write : in std_logic;
       addr  : in std_logic_vector(addrSize - 1 downto 0);
       sRamOut: out std_logic_vector(7 downto 0);
       done   : out std_logic);
end component;

signal scount12 : unsigned (11 downto 0) := (others => '0');
signal sclk_en_16_x_baud : std_logic := '0';

signal send_data, send_data_complete, read_data, read_data_complete : std_logic;
signal data_In,regA,regB,txIn,fRXout,fTXout                         : std_logic_vector(7 downto 0);
signal blk_mem_out,regC                                             : std_logic_vector(15 downto 0);
constant equal                                                      : std_logic_vector(7 downto 0) := "00111101";


type   tstates is(idle, read1, readWait1, checkChar,write1,readStatus,readRow,readCol,readSize,readImage,writeImage,
writefRX,writefTX,readfRX,readfTX,writeWait,finalWait);

signal sstate,nextState : tstates;
signal ffullRX,femptyRX,ffullTX,femptyTX,wrRX,rdRX,wrTX,rdTX        : std_logic;
signal coprocessorEn, sigA, sigB                                    : std_logic;
signal maxRow,maxCol                                                : std_logic_vector(15 downto 0);
signal max_size                                                     : std_logic_vector(31 downto 0);
-- Control signals
signal read_Row,read_Col,read_Size,read_Image : std_logic;


--Coprocessor signals
signal read_En : std_logic  := '0';
signal write_En : std_logic := '0';
signal mem_Out : std_logic_vector(7 downto 0);
signal coprocessor_Done : std_logic;
signal addr : std_logic_vector(7 downto 0) := x"00";


begin 


process(CLK_100MHZ)
variable size : integer:= 8;
variable count : integer:=0;

begin   
    
   if CLK_100MHZ'event and CLK_100MHZ = '1' then
	  if sclk_en_16_x_baud = '1' then
	    case sstate is
	      -- Read cases
	      when idle   => if UART_RX = '0' then sstate <= read1; end if;
          when read1  => sstate <= readWait1;			
		  when readWait1  => if (read_data_complete = '1' and read_row = '1') 
		                          then nextState <= readRow; 
		                               sstate <= writefRX; 
		                               count := count + 1;
		                     elsif (read_data_complete = '1' and read_col = '1')
		                          then nextState <= readCol; 
		                               sstate <= writeFRX;
		                               count := count + 1;
		                     elsif (read_data_complete = '1' and read_size = '1')
		                          then  
		                                  nextState <= readSize; 
		                                  sstate <= writefRX;
		                                  count := count + 1;
                             elsif (read_data_complete = '1' and read_Image = '1')
                                  then                              
                                          nextState <= readImage;                 
                                          sstate <= writefRX;                    
                                                             		                     
		                     elsif(read_data_complete = '1') then  nextState <= checkChar; sstate <= writefRX; end if;
		                       
		  when checkChar =>
		                 if(fRXout = x"01") then
		                      read_Row <= '1';
		                      sstate <= finalWait;
		                 elsif(fRXout = x"02") then
		                     sstate <= writeImage;
		                     addr <= (others=>'0');
		                 else
		                    sstate <= finalWait;
		                 end if;
		  when readRow => maxRow(size-1 downto size-8) <= fRXout; 
		                  size := size + 8;
		                  if count = 2 then
		                      count := 0;
		                      size := 8;
		                      read_Row <= '0';
		                      read_Col <='1';
		                  end if;
		                  sstate<= finalWait;
		                                      
		  when readCol => maxCol(size-1 downto size-8) <= fRXout;
		                  size := size + 8;
		                  if count = 2 then
		                      count:= 0;
		                      size := 8;
		                      read_Col <= '0';
		                      read_Size <= '1';
		                  end if;
		                  sstate <= finalWait;
		  when readSize => max_size(size-1 downto size-8) <= fRXout;
		                  size := size + 8;
		                  if count = 4 then
		                     count:= 0;
		                     size := 8;
		                     read_Size <= '0';
		                     read_Image<= '1';
		                  end if;
		                 sstate <= finalWait;
		  when readImage =>

		                 -- Increment counter
		                 

		                 --Finish Reading
		               if(unsigned(addr)<unsigned(max_size)-1) then
		                 if coprocessor_Done = '1' then
                                         write_En<= '0';
                                         addr<= std_logic_vector((unsigned(addr)) + 1);
                                         sstate <= finalWait;
                                    else
                                         write_En <= '1';     
                                         sstate <= readImage;
                                    end if;
		                 else
		                      write_En <= '1';
		                      read_Image <= '0';
		                      count := 0;
		                      sstate <= finalWait;
		                end if;
		                 
		                 -- read into memory
		                 
		     
		  -- Read Fifo States
		  when writefRX => sstate<= readfRX;
		  when readfRX => sstate<= readStatus;
		  when readStatus => sstate <= nextState;
		  --Write Fifo states
		  when writefTX => sstate<= readfTX;
		  when readfTX => sstate <= nextState;
		  
		  
		  
		  --Write cases
		  when writeImage => if(unsigned(addr)<unsigned(max_size)) then
		                          if (coprocessor_Done = '1') then
		                              addr <= std_logic_vector(unsigned(addr) + 1);
		                              read_En <= '0';
		                              sstate <= write1;
		                              txIn<=mem_Out;
		                          else
		                              read_En <= '1';
		                          end if;
		                     else
		                          sstate<=finalWait;
		                     end if;
		  
		  when write1 => sstate <= writeWait;
		  when writeWait  => if send_data_complete = '1' then 
		                                                      --addr<=std_logic_vector(unsigned(addr) + 1);
		                                                      sstate <= writefTX; nextState<= writeImage; end if;
		  when finalWait  => if UART_RX = '1' then write_En <= '0'; sstate <= idle; end if;
		end case;
    end if;
  end if;
end process;  

process(sstate)
begin
  case sstate is
     when read1  => 
                    send_data <= '0';
                    read_data <= '1';
                    
     when checkChar =>
                    send_data <= '0';
                    read_data <= '0';

     when write1=> 
                    send_data <= '1';
                    read_data <= '0';
                                                   
	 when others => 
	                send_data <= '0';
	                read_data <= '0';
	                
  end case;
end process;

--read and write from FIFOs
process(sstate)
begin 
    case(sstate) is
        when writefRX =>
                     wrRX <= '1';
        when writefTX =>
                      wrTX <= '1';
        when readfRX => 
                      rdRX <= '1';
                      wrRX <= '0';
                       
        when readfTX =>
                      rdTX <= '1';
                      wrTX <= '0';
        when readStatus =>
                    coprocessorEn <= '1';
                    rdRx <= '0';
        when others => 
                        wrRX <= '0';
                        rdTX <= '0';
                        rdRX <= '0';
                        wrTX <= '0';
                        coprocessorEn <= '0';
    end case;
end process;

LEDS(7 downto 0) <= fTXout(7 downto 0);
--Mapping to components
COPROCESSOR1: coprocessor
generic map( waitVal => 50,addrSize => 8)
port map(
        clk => CLK_100MHZ,
       sRamIn => fRXOUT,
       read  => read_En,       
       write => write_En,
       addr  => addr,
       sRamOut => mem_Out,
       done   => coprocessor_Done);

FIFO_RX_INSTANCE: FIFO 
generic map(
    depth =>512,
    width =>8)
port map(
    clk => CLK_100MHZ,
    rst => rst,
    wr => wrRX,
    rd => rdRX,
    d_in => data_in,
    f_full => ffullRX,
    f_empty => femptyRX, 
    d_out => fRXout);  
FIFO_TX_INSTANCE:FIFO 
generic map(
    depth =>1024,
    width =>8)
port map(
    clk => CLK_100MHZ,
    rst => rst,
    wr => wrTX,
    rd => rdTX,
    d_in => txIn,
    f_full => ffullTX,      
    f_empty => femptyTX, 
    d_out => fTXout);
    
MLUART_TX_INSTANCE_01:MLUART_TX 
port map
     ( CLK_100MHZ         => CLK_100MHZ,
       clk_en_16_x_baud   => sclk_en_16_x_baud,   
	   data_in            => fTXout,
	   send_data          => send_data,
	   UART_TX            => UART_TX,
	   send_data_complete => send_data_complete);

MLUART_RX_INSTANCE_01:MLUART_RX 
port map
     ( CLK_100MHZ         => CLK_100MHZ,
       clk_en_16_x_baud   => sclk_en_16_x_baud,
       read_data          => read_data,
       UART_RX            => UART_RX,
       outData            => data_In,
       read_data_complete => read_data_complete);
  

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

end Behavioral;
