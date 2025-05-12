library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        
        signal twelveSegment_ROM : rom_type := (
            "101110000011", --MOVI R7,3 => R7=3
            "100010000001", --MOVI R1,1 => R1=1
            "010010000000", --NEG R1    => R1=-1
            "100100000010", --MOVI R2,2 => R2=2
            "001110100000", --ADD R7,R2 => R7=5 
            "000100010000", --ADD R2,R1 => R2=1 
            "001110100000", --ADD R7,R2 => R7=6
            "110000000111"  --JZR R0,7  => GOES TO 7th INSTRUCTION IF R2==0 WHICH IS NOT
            );

begin
    data <= twelveSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
