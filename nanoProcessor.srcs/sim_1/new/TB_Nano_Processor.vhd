library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Nano_Processor is
--  Port ( );
end TB_Nano_Processor;

architecture Behavioral of TB_Nano_Processor is
    component NanoProcessor is
        Port ( Clk : in STD_LOGIC;
               change_program : in STD_LOGIC;
               Reset : in STD_LOGIC;
               LED : out STD_LOGIC_VECTOR (3 downto 0);
               S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
               anode : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

signal clock : std_logic := '0';

--signal Clk : STD_LOGIC;
signal chng_program : STD_LOGIC := '0';
signal Reset : STD_LOGIC := '0';
signal LED : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal S_7seg : STD_LOGIC_VECTOR (6 downto 0);
signal anode : STD_LOGIC_VECTOR (3 downto 0);
signal Overflow : STD_LOGIC := '0';
signal Zero : STD_LOGIC;

begin
    UUT : NanoProcessor
    Port map ( Clk => clock,
               change_program=> chng_program,
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

stimulus_proc : process
begin
    chng_program <= '0'; -- Start with first program
    wait for 1000 ns;
    

    chng_program <= '1'; -- Switch to second program
    wait for 1000 ns;

    wait; -- hold simulation
end process;

end Behavioral;
