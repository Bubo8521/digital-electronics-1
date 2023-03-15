----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2023 02:20:14 PM
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC      : in STD_LOGIC;
           SW        : in STD_LOGIC;
           LED       : out STD_LOGIC_VECTOR (3 downto 0));
end tb_top;

architecture Behavioral of tb_top is

begin
  -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_top : entity work.top
        port map (
            CLK100MHZ   => sig_CLK_100MHz,
            BTNC   => sig_BTNC,
            SW     => sig_SW,
            LED    => sig_LED
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
  p_clk_gen : process
	begin
		while now < 40 ms loop        
			s_clk_100MHz <= '0';
			wait for c_CLK_100MHZ_PERIOD / 2;
			s_clk_100MHz <= '1';
			wait for c_CLK_100MHZ_PERIOD / 2;
		end loop;
		wait;
	end process p_clk_gen;
	 p_reset_gen : process
		begin
			s_rst <= '0';
			wait for 18 ns;

			-- Reset activated
			s_rst <= '1';
			wait for 13 ns;

			--Reset deactivated
			s_rst <= '0';

			wait for 47 ns;

			s_rst <= '1';
			wait for 33 ns;

			wait for 660 ns;
			s_rst <= '1';

			wait;
	 end process p_reset_gen;
	p_stimulus : process
	begin
		report "Stimulus process started" severity note;

		s_j  <= '0';
		s_k  <= '0';

		--d sekv
		wait for 38 ns;

		assert ((s_rst = '0') and (s_j = '0') and (s_k = '0') and (s_q = '0') and (s_q_bar = '1'))
		report "Test failed, reset = 0, after clk rising when s_j = 0 and s_k = 0" severity error;

		wait for 2 ns;
		s_j  <= '1';
		s_k  <= '0';
		wait for 6 ns;

		assert ((s_rst = '0') and (s_j = '1') and (s_k = '0') and (s_q = '1') and (s_q_bar = '0'))
		report "Test failed, reset = 0, after clk rising when s_j = 1 and s_k = 0" severity error;

		wait for 1 ns;
		s_j  <= '0';
		s_k  <= '1';
		wait for 13 ns;

		assert ((s_rst = '0') and (s_j = '0') and (s_k = '1') and (s_q = '0') and (s_q_bar = '1'))
		report "Test failed, reset = 0, after clk rising when s_j = 0 and s_k = 1" severity error;

		wait for 1 ns;
		s_j  <= '1';
		s_k  <= '0';
		wait for 7 ns;
		s_j  <= '1';
		s_k  <= '1';

		wait for 8 ns;

		assert ((s_rst = '0') and (s_j = '1') and (s_k = '1') and (s_q = '0') and (s_q_bar = '1'))
		report "Test failed, reset = 0, after clk rising when s_j = 1 and s_k = 1" severity error;

		wait for 2 ns;
		s_j  <= '0';
		s_k  <= '0';
		wait for 7 ns;
		s_j  <= '0';
		s_k  <= '1';
		wait for 7 ns;
		s_j  <= '1';
		s_k  <= '0';
		wait for 7 ns;
		s_j  <= '1';
		s_k  <= '1';

		report "Stimulus process finished" severity note;
		wait;
	end process p_stimulus;
end architecture testbench;

