library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_to_3 is
    Port ( A0 : in STD_LOGIC_VECTOR (2 downto 0);
           A1 : in STD_LOGIC_VECTOR (2 downto 0);
           JMP_FLAG : in STD_LOGIC;
           M2_3_out : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_to_3;

architecture Behavioral of Mux_2_to_3 is
begin
 
M2_3_out <= A0 when JMP_FLAG = '0' else A1;

end Behavioral;
