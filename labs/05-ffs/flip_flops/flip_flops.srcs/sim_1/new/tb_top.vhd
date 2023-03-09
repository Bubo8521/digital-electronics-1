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
    p_clk_gen : process is
    begin
        while now < 300 ns loop -- 30 periods of 100MHz clock
            sig_CLK_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_CLK_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_btnc_gen : process is
    begin
        sig_BTNC <= '0';

        -- ACTIVATE AND DEACTIVATE RESET HERE
        wait for 65 ns;
        sig_BTNC <= '1';
        wait for 23 ns;
        sig_BTNC <= '0';

        wait;
    end process p_btnc_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process is
    begin
        report "Stimulus process started";
        sig_SW <='0'; wait for 13 ns;
        sig_SW <='1'; wait for 33 ns;
        sig_SW <='0'; wait for 28 ns;
        sig_SW <='1'; wait for 66 ns;
        sig_SW <='0'; wait for 33 ns;
        -- DEFINE YOUR INPUT DATA HERE

        report "Stimulus process finished";
        wait;
    end process p_stimulus;

end architecture testbench;

