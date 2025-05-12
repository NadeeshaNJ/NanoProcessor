library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit4_Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Neg : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end bit4_Add_Sub_Unit;

architecture Behavioral of bit4_Add_Sub_Unit is
    component FA is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;

signal FA0_C, FA1_C, FA2_C, FA3_C : std_logic; 
signal A0_xor_Neg, A1_xor_Neg, A2_xor_Neg, A3_xor_Neg : std_logic;
signal Sum : std_logic_vector (3 downto 0);

begin
    A0_xor_Neg <= A(0) xor Neg;
    A1_xor_Neg <= A(1) xor Neg;
    A2_xor_Neg <= A(2) xor Neg;
    A3_xor_Neg <= A(3) xor Neg;
    
    FA_0 : FA
        port map (
            A => A0_xor_Neg,
            B => B(0),
            C_in => Neg,
            S => Sum(0),
            C_out => FA0_C);
        
    FA_1 : FA
        port map (
            A => A1_xor_Neg,
            B => B(1),
            C_in => FA0_C,
            S => Sum(1),
            C_out => FA1_C);
         
     FA_2 : FA
        port map (
            A => A2_xor_Neg,
            B => B(2),
            C_in => FA1_C,
            S => Sum(2),
            C_out => FA2_C);
          
    FA_3 : FA
        port map (
            A => A3_xor_Neg,
            B => B(3),
            C_in => FA2_C,
            S => Sum(3),
            C_out => FA3_C);
        
    Overflow <= FA2_C xor FA3_C;
    Zero <= '1' when Sum = "0000" else '0';
    S <= Sum;

end Behavioral;
