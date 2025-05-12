----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2025 21:42:09
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
    
    component Instruction_Decoder
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
    end component;
    
    signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
    signal Register_enable : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_select : STD_LOGIC;
    signal Immediate_value : STD_LOGIC_VECTOR (3 downto 0);
    signal Register_select_A : STD_LOGIC_VECTOR (2 downto 0);
    signal Register_select_B : STD_LOGIC_VECTOR (2 downto 0);
    signal Neg : STD_LOGIC;
    signal Reg_check_jmp : STD_LOGIC_VECTOR (3 downto 0);
    signal jmp_flag : STD_LOGIC;
    signal jmp_addr : STD_LOGIC_VECTOR (2 downto 0);

begin
    UUT : Instruction_Decoder
    port map ( Instruction_Bus => Instruction_Bus,
               Register_enable => Register_enable,
               Load_select => Load_select,
               Immediate_value => Immediate_value,
               Register_select_A => Register_select_A,
               Register_select_B => Register_select_B,
               Neg => Neg,
               Reg_check_jmp => Reg_check_jmp,
               jmp_flag => jmp_flag,
               jmp_addr => jmp_addr);
               
process begin
    Instruction_Bus <= "100110000101";
    wait for 100ns;
    
    Instruction_Bus <= "000010100000";
    wait for 100ns;

    Instruction_Bus <= "011000000000";
    wait for 100ns;
    
    Instruction_Bus <= "110110000110";
    wait;
        
end process;

end Behavioral;
