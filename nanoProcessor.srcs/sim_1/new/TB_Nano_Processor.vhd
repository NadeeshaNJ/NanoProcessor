library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is
    component NanoProcessor is
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               LED : out STD_LOGIC_VECTOR (3 downto 0);
               S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
               anode : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

signal clock : std_logic := '0';

--signal Clk : STD_LOGIC;
signal Reset : STD_LOGIC := '0';
signal LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7seg : STD_LOGIC_VECTOR (6 downto 0);
signal anode : STD_LOGIC_VECTOR (3 downto 0);
signal Overflow : STD_LOGIC;
signal Zero : STD_LOGIC;

begin
    UUT : NanoProcessor
    Port map ( Clk => clock,
               Reset => Reset,
               LED => LED,
               S_7seg => S_7seg,
               anode => anode,
               Overflow => Overflow,
               Zero => Zero);
    
process begin
    wait for 5ns;
    clock <= not clock;
end process;

end Behavioral;
