library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit3_Adder is
    Port ( R : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end bit3_Adder;

architecture Behavioral of bit3_Adder is

begin

    Y(0) <= not R(0);
    Y(1) <= R(1) xor R(0);
    Y(2) <= R(2) xor (R(1) and R(0));

end Behavioral;