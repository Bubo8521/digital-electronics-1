----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 12:05:25 PM
-- Design Name: 
-- Module Name: tb_mux_3bit_4to1 - Behavioral
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

entity tb_mux_3bit_4to1 is
--  Port ( );
end tb_mux_3bit_4to1;

architecture Behavioral of tb_mux_3bit_4to1 is

  -- Testbench local signals
  signal sig_a           : std_logic_vector(2 downto 0);
  signal sig_b           : std_logic_vector(2 downto 0);
  signal sig_c           : std_logic_vector(2 downto 0);
  signal sig_d           : std_logic_vector(2 downto 0);
  signal sig_sel         : std_logic_vector(1 downto 0);
  signal sig_f_o         : std_logic_vector(2 downto 0);
  
begin

    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
    port map (
      a           => sig_a,
      b           => sig_b,
      c           => sig_c,
      d           => sig_d,
      sel         => sig_sel,
      f_o         => sig_f_o
    );
    
  p_stimulus : process is
  begin

    sig_a <= "001";
    sig_b <= "010";
    sig_c <= "011";
    sig_d <= "111";
    
    sig_sel <= "00";
    wait for 100 ns;
    assert (
            (sig_f_o = sig_d)
        )
      report "Input sel=00 FAILED"
      severity error;
      

    sig_sel <= "01";
    wait for 100 ns;
    assert (
            (sig_f_o = sig_c)
        )
      report "Input sel=01 FAILED"
      severity error;
      
      
     sig_sel <= "10";
    wait for 100 ns;
    assert (
            (sig_f_o = sig_b)
        )
      report "Input sel=10 FAILED"
      severity error;
      
      
     sig_sel <= "11";
    wait for 100 ns;
    assert (
            (sig_f_o = sig_a)
        )
      report "Input sel=11 FAILED"
      severity error;

  end process p_stimulus;

end Behavioral;
