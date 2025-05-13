library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Slow_Clock is
--  Port ( );
end TB_Slow_Clock;

architecture Behavioral of TB_Slow_Clock is
    
    component Slow_Clk is
        Port ( Clk_in : in STD_LOGIC;
               Clk_Out : out STD_LOGIC);
    end component;

    signal Clk_in, Clk_Out : STD_LOGIC := '0';
begin
    UUT : Slow_Clk
    Port map ( Clk_in => Clk_in,
               Clk_Out => Clk_Out);
   
    process begin
        Clk_in <= not Clk_in;
        wait for 5ns;
    end process;
                   

end Behavioral;
