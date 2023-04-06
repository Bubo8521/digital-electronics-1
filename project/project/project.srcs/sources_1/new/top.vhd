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
           CA        : out STD_LOGIC;
           CB        : out STD_LOGIC;
           CC        : out STD_LOGIC;
           CD        : out STD_LOGIC;
           CE        : out STD_LOGIC;
           CF        : out STD_LOGIC;
           CG        : out STD_LOGIC;
           AN        : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC      : in STD_LOGIC);
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------

architecture behavioral of top is

    signal sig_wheel : std_logic_vector(3 downto 0);
    signal sig_ps : std_logic_vector(3 downto 0);

begin

 timer : entity work.timer
    port map (
      clck      => CLK100MHZ,
      rst => BTNC,
      ps => sig_ps,
      wheel => sig_wheel
    );
      
  driver_7seg_4digits : entity work.driver_7seg_4digits
      port map(
            clk    
            rst     
            data0   
            data1   
            data2   
            data3   
            dp_vect 
            dp      
            seg     
            dig  
      );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Connect one common anode to 3.3V
  AN <= b"1111_1110";

end architecture behavioral;