library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
           Register_enable : out STD_LOGIC_VECTOR (2 downto 0);
           Load_select : out STD_LOGIC;
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Register_select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Register_select_B : out STD_LOGIC_VECTOR (2 downto 0);
           Neg : out STD_LOGIC;
           Reg_check_jmp : in STD_LOGIC_VECTOR (3 downto 0);
           jmp_flag : out STD_LOGIC;
           jmp_addr : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
    Register_enable <= Instruction_Bus(9 downto 7);
    Load_select <= Instruction_Bus(11);
    Immediate_value <= Instruction_Bus(3 downto 0);
    Register_select_A <= Instruction_Bus(9 downto 7);
    Register_select_B <= Instruction_Bus(6 downto 4);
    Neg <= Instruction_Bus(10);
    jmp_flag <= '1' when Reg_check_jmp = "0000" and Instruction_Bus(11 downto 10) = "11" else '0';
    jmp_addr <= Instruction_Bus(2 downto 0);
    
end Behavioral;
