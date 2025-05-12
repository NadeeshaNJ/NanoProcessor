library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Reg_types.all;

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Bus : out Reg_array);
end Register_Bank;

architecture Behavioral of Register_Bank is
    component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC := '1';
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;  

    component Reg
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               EN : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;  
      
signal Reg_EN_out : STD_LOGIC_VECTOR (7 downto 0);
signal Input_line : STD_LOGIC_VECTOR (3 downto 0);
signal Data_Buses : Reg_array;

begin
    Input_line <= "0000" when ( Reset='1' ) else input;

    Decoder : Decoder_3_to_8 
        port map(
            I=>Reg_EN,
            Y=>Reg_EN_out);
                  
    Reg_0 : Reg 
        port map(
            D=>"0000",
            EN=>'1',
            Clk =>Clk,
            Q=>Data_Buses(0));
            
    gen_regs: for i in 1 to 7 generate
        reg_inst: Reg
            port map (
                D   => Input_line,
                EN  => Reg_EN_out(i),
                Clk => Clk,
                Q=>Data_Buses(i));
        end generate;
    
    Data_Bus <= Data_Buses;
                

end Behavioral;
