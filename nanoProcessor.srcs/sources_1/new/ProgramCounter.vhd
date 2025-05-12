library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0):= "000";
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0):= "000");
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

-- Here we have modified the code used in Lab 5. Instead of using DFFs, a bus is used.   
process(Clk) begin
if(rising_edge(Clk)) then
    if(Res ='1') then
        Q <= "000";
    else
        Q <= D;
    end if;
end if;

end process;

end Behavioral;
