----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2025 18:58:25
-- Design Name: 
-- Module Name: TB_bit4_Add_Sub_Unit - Behavioral
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

entity TB_bit4_Add_Sub_Unit is
--  Port ( );
end TB_bit4_Add_Sub_Unit;

architecture Behavioral of TB_bit4_Add_Sub_Unit is

    component bit4_Add_Sub_Unit
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Neg : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;
    
    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal B : STD_LOGIC_VECTOR (3 downto 0);
    signal Neg : STD_LOGIC := '0';
    signal S : STD_LOGIC_VECTOR (3 downto 0);
    signal Overflow : STD_LOGIC;
    signal Zero : STD_LOGIC;

begin

UUT : bit4_Add_Sub_Unit
    Port map( A => A,
              B => B,
              Neg => Neg,
              S => S,
              Overflow => Overflow,
              Zero => Zero);
process begin
    A <= "0001";
    B <= "0010";
    wait for 100ns;
    
    A <= "0101";
    B <= "0011";
    wait for 100ns;
    
    A <= "0101";
    B <= "0000";
    Neg <= '1';
    wait for 100ns;
    
    A <= "0111";
    B <= "0000";
    Neg <= '1';
    wait for 100ns;
    
    A <= "1111";
    B <= "0000";
    Neg <= '1';
    wait for 100ns;
    
    A <= "1011";
    B <= "0000";
    Neg <= '1';
    wait;

end process;

end Behavioral;
