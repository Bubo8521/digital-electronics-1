----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 02:14:17 PM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC      : in STD_LOGIC;
           SW        : in STD_LOGIC;
           LED       : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is

  -- Internal signals between flip-flops
  signal sig_ff0 : std_logic;
  signal sig_ff1 : std_logic;
  signal sig_ff2 : std_logic;
  signal sig_ff3 : std_logic;

  -- WRITE YOUR CODE HERE

begin

  --------------------------------------------------------------------
  -- Four instances (copies) of D-type FF entity
  d_ff_0 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          d   => SW,
          -- WRITE YOUR CODE HERE
          
          q   => sig_ff0
      );

  d_ff_1 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          d   => SW,
          -- WRITE YOUR CODE HERE
          q   => sig_ff1
      );

 d_ff_2 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          d   => SW,
          -- WRITE YOUR CODE HERE
          q   => sig_ff2
      );
      
 d_ff_3 : entity work.d_ff_rst
      port map (
          clk => CLK100MHZ,
          rst => BTNC,
          d   => SW,
          -- WRITE YOUR CODE HERE
          q   => sig_ff3
      );
end process top;

architecture Behavioral of jk_ff_rst is

      jk_ff_rst : process (clk)
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    sig_q <= '0';
                else
                    if (j = '0' and k = '0') then
                        sig_q <= sig_q;
                    elsif (j = '0' and k = '1') then
                        sig_q <= '0';
                    elsif (j = '1' and k = '0') then
                        sig_q <= '1';
                    elsif (j = '1' and k = '1') then
                        sig_q <= not sig_q;
                    end if;
                end if;
            end if;
        end process jk_ff_rst;
    q     <= sig_q;
    q_bar <= not sig_q;     
     
end architecture behavioral;

