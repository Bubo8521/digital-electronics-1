------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado 2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_mux_3bit_4to1 is
  -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_mux_3bit_4to1 is

  -- Testbench local signals
  signal sig_b           : std_logic_vector(3 downto 0);
  signal sig_a           : std_logic_vector(3 downto 0);
  signal sig_c           : std_logic_vector(3 downto 0);
  signal sig_d           : std_logic_vector(3 downto 0);
  signal sig_sel         : std_logic;
  signal sig_f_0         : std_logic;
  signal sig_b_less_a    : std_logic;

begin

  -- Connecting testbench signals with mux_3bit_4to1
  -- entity (Unit Under Test)
  uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
    port map (
      b_i           => sig_b,
      a_i           => sig_a,
      c_i           => sig_c,
      d_i           => sig_d,  
      sel           => sig_sel,
      f_o           => sig_f_o
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
p_label : process (a)
begin
    case a is
        when '0' =>
            q <= '0';
        when others =>
            q <= '1';
    end case;
end process p_label;

end architecture testbench;