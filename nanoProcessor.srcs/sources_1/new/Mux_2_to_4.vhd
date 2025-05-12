library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_to_4 is
    Port ( B0 : in STD_LOGIC_VECTOR (3 downto 0);
           B1 : in STD_LOGIC_VECTOR (3 downto 0);
           LoadSel : in STD_LOGIC;
           M2_4_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_to_4;

architecture Behavioral of Mux_2_to_4 is
begin

M2_4_out <= B0 when LoadSel = '0' else B1;

end Behavioral;
