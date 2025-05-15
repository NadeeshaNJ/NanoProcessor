library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           change_program : in STD_LOGIC:='0'; 
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        
        signal First_Program : rom_type := (
            "101110000011", --MOVI R7,3 => R7=3
            "100010000001", --MOVI R1,1 => R1=1
            "010010000000", --NEG R1    => R1=-1
            "100100000010", --MOVI R2,2 => R2=2
            "001110100000", --ADD R7,R2 => R7=5 
            "000100010000", --ADD R2,R1 => R2=1 
            "001110100000", --ADD R7,R2 => R7=6
            "110000000111"  --JZR R0,7  => GOES TO 7th INSTRUCTION IF R0==0 WHICH IS NOT
            );
        signal Second_Program : rom_type:=(
            "101110000001", --MOVI R7,1 => R7=1
            "101010000010", --MOVI R5,2 => R5=2
            "011110000000", --NEG R7    => R7=-1
            "101100000011", --MOVI R6,3 => R6=3
            "001111010000", --ADD R7,R5 => R7=1 
            "001111100000", --ADD R7,R6 => R7=4 
            "011110000000", --NEG R7    => R7=-4
            "110000000000"  --JZR R0,0  => GOES TO 0th instruction if R0==0 which is
                    );
begin
    process(change_program,address)
    begin
        if change_program ='1' then
            data <= Second_Program(to_integer(unsigned(address)));
        else
            data <= First_Program(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;

