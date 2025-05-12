----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2025 15:51:58
-- Design Name: 
-- Module Name: TB_bit3_Adder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_bit3_Adder is
--  Port ( );
end TB_bit3_Adder;

architecture Behavioral of TB_bit3_Adder is
    component bit3_Adder is
        Port ( R : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal R, Y : STD_LOGIC_VECTOR (2 downto 0);
    
begin
    UUT : bit3_Adder
     Port map ( R => R,
                Y => Y);
process begin
    R <= "000";
    wait for 100ns;
    
    R <= "101";
    wait for 100ns;
    
    R <= "011";
    wait for 100ns;
    
    R <= "111";
    wait for 100ns;
    
    R <= "010";
    wait;
end process;

end Behavioral;
