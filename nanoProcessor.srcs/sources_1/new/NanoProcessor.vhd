library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Reg_types.all;

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end NanoProcessor;

architecture Behavioral of NanoProcessor is
    
    component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
    end component;

    component ProgramCounter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Program_ROM is
        Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
               data : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component Instruction_Decoder is
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
    
    component Register_Bank is
        Port ( Clk : in STD_LOGIC;
               Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
               Reset : in STD_LOGIC;
               input : in STD_LOGIC_VECTOR (3 downto 0);
               Data_Bus : out Reg_array);
    end component;
    
    component Mux_8_to_4 is
        Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
               R1 : in STD_LOGIC_VECTOR (3 downto 0);
               R2 : in STD_LOGIC_VECTOR (3 downto 0);
               R3 : in STD_LOGIC_VECTOR (3 downto 0);
               R4 : in STD_LOGIC_VECTOR (3 downto 0);
               R5 : in STD_LOGIC_VECTOR (3 downto 0);
               R6 : in STD_LOGIC_VECTOR (3 downto 0);
               R7 : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC_VECTOR (2 downto 0);
               M8_4_out : out STD_LOGIC_VECTOR (3 downto 0));    
    end component;
    
    component bit4_Add_Sub_Unit is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Neg : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;
    
    component Mux_2_to_4 is
        Port ( B0 : in STD_LOGIC_VECTOR (3 downto 0);
               B1 : in STD_LOGIC_VECTOR (3 downto 0);
               LoadSel : in STD_LOGIC;
               M2_4_out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Mux_2_to_3 is
        Port ( A0 : in STD_LOGIC_VECTOR (2 downto 0);
               A1 : in STD_LOGIC_VECTOR (2 downto 0);
               JMP_FLAG : in STD_LOGIC;
               M2_3_out : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component bit3_Adder is
        Port ( R : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component LUT_11_7 is
        Port ( Clk : in STD_LOGIC;
               number : in STD_LOGIC_VECTOR (3 downto 0);
               anode : out STD_LOGIC_VECTOR (3 downto 0);
               S_7seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

signal pc_out, pc_in : STD_LOGIC_VECTOR (2 downto 0);
signal slw_clk : std_logic;
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
signal Register_enable : STD_LOGIC_VECTOR (2 downto 0);
signal Load_select : std_logic;
signal Immediate_value : STD_LOGIC_VECTOR (3 downto 0);
signal Register_select_A, Register_select_B : STD_LOGIC_VECTOR (2 downto 0);
signal Neg : std_logic;
signal jmp_flag : std_logic;
signal jmp_addr : STD_LOGIC_VECTOR (2 downto 0);
signal Data : STD_LOGIC_VECTOR (3 downto 0);
signal Data_Bus : Reg_array;
signal M8_4_out_A, M8_4_out_B :  STD_LOGIC_VECTOR (3 downto 0);
signal S : STD_LOGIC_VECTOR (3 downto 0);
signal next_addr : STD_LOGIC_VECTOR (2 downto 0);

begin

    Slow_Clk_0 : Slow_Clk
        Port map ( Clk_in => Clk,
                   Clk_Out => slw_clk);
    
    ProgramCounter_0 : ProgramCounter
        Port map ( D => pc_in,
                   Res => Reset,
                   Clk => slw_clk,
                   Q => pc_out);
      
    Program_ROM_0 : Program_ROM
        Port map ( address => pc_out,
                   data => Instruction_Bus);
                   
    Instruction_Decoder_0 : Instruction_Decoder
        Port map ( Instruction_Bus => Instruction_Bus,
                   Register_enable => Register_enable,
                   Load_select => Load_select,
                   Immediate_value => Immediate_value,
                   Register_select_A => Register_select_A,
                   Register_select_B => Register_select_B,
                   Neg => Neg,
                   Reg_check_jmp => M8_4_out_A,
                   jmp_flag => jmp_flag,
                   jmp_addr => jmp_addr);
                   
    Register_Bank_0 : Register_Bank
        Port map ( Clk => slw_clk,
                   Reg_EN => Register_enable,
                   Reset => Reset,
                   input => Data,
                   Data_Bus => Data_Bus);
                   
    Mux_8_to_4_A : Mux_8_to_4
        Port map ( R0 => Data_Bus(0),
                   R1 => Data_Bus(1),
                   R2 => Data_Bus(2),
                   R3 => Data_Bus(3),
                   R4 => Data_Bus(4),
                   R5 => Data_Bus(5),
                   R6 => Data_Bus(6),
                   R7 => Data_Bus(7),
                   Sel => Register_select_A,
                   M8_4_out => M8_4_out_A);

    Mux_8_to_4_B : Mux_8_to_4
        Port map ( R0 => Data_Bus(0),
                   R1 => Data_Bus(1),
                   R2 => Data_Bus(2),
                   R3 => Data_Bus(3),
                   R4 => Data_Bus(4),
                   R5 => Data_Bus(5),
                   R6 => Data_Bus(6),
                   R7 => Data_Bus(7),
                   Sel => Register_select_B,
                   M8_4_out => M8_4_out_B);
    
    bit4_Add_Sub_Unit_0 : bit4_Add_Sub_Unit
        Port map ( A => M8_4_out_A,
                   B => M8_4_out_B,
                   Neg => Neg,
                   S => S,
                   Overflow => Overflow,
                   Zero => Zero);
                   
    Mux_2_to_4_0 : Mux_2_to_4
        Port map ( B0 => S,
                   B1 => Immediate_value,
                   LoadSel => Load_select,
                   M2_4_out => Data);
                   
    Mux_2_to_3_0 : Mux_2_to_3
        Port map ( A0 => next_addr,
                   A1 => jmp_addr,
                   JMP_FLAG => jmp_flag,
                   M2_3_out => pc_in);
                   
    bit3_Adder_0 : bit3_Adder
        Port map ( R => pc_out,
                   Y => next_addr);
                   
    LUT_11_7_0 : LUT_11_7
        Port map ( Clk => Clk,
                   number => Data_Bus(7),
                   anode => anode,
                   S_7seg => S_7seg);
                        
    LED <= Data_Bus(7);
    
end Behavioral;
