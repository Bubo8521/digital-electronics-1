----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 01:44:12 PM
-- Design Name: 
-- Module Name: timer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer is
    Port ( clck : in STD_LOGIC;
           rst : in STD_LOGIC;
           wheel : out STD_LOGIC_VECTOR (3 downto 0);
           ps : out STD_LOGIC_VECTOR (3 downto 0)
           );
end timer;

architecture Behavioral of timer is

 type t_state is(
 PAUSE,
 GO
 );

  -- Define the signal that uses different states
  signal sig_state : t_state;
  
  -- Internal clock enable
  signal sig_en : std_logic;
  
  -- Local delay counter
  signal sig_cnt : unsigned(4 downto 0);
  
  -- Specific values for local counter
  constant c_DELAY_4SEC : unsigned(4 downto 0) := b"1_0000"; --! 4-second delay
  constant c_DELAY_2SEC : unsigned(4 downto 0) := b"0_1000"; --! 2-second delay
  
begin

clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 1
      -- FOR IMPLEMENTATION, CALCULATE VALUE: 250 ms / (1/100 MHz)
      -- 1   @ 10 ns
      -- ??? @ 250 ms
      g_MAX => 25000000
    )
    port map (
      clk => clck,
      rst => rst,
      ce  => sig_en
    );
--------------------------------------------------------
-- p_traffic_fsm: 
-- A sequential process with synchronous reset and
-- clock_enable entirely controls the sig_state signal
-- by CASE statement.
--------------------------------------------------------
p_timer_fsm : process (clck) is
begin
if (rising_edge(clck)) then
      if (rst = '1') then               -- Synchronous reset
        sig_state <= GO;                -- Init state
        sig_cnt   <= (others => '0');   -- Clear delay counter
      elsif (sig_en = '1') then
        -- Every 250 ms, CASE checks the value of sig_state
        -- local signal and changes to the next state 
        -- according to the delay value.
        case sig_state is
        
         when GO =>
          -- Count to 2 secs
            if (sig_cnt < c_DELAY_4SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= PAUSE;
              -- Reset delay counter value
              sig_cnt   <= (others => '0');
            end if;
            
          when PAUSE =>
            -- Count to 2 secs
            if (sig_cnt < c_DELAY_2SEC) then
              sig_cnt <= sig_cnt + 1;
            else
              -- Move to the next state
              sig_state <= GO;
              -- Reset delay counter value
              sig_cnt   <= (others => '0');
            end if;
            
          end case;
        end if;
      end if;
      
end process p_timer_fsm;
 
p_output_fsm : process (sig_state) is
  begin

    case sig_state is
    
      when GO =>
        wheel <= "1000";
        ps <= "0000";
        
      when PAUSE =>
        wheel <= "0000";
        ps <= "1000";
        
     end case;
   end process p_output_fsm;
end Behavioral;
