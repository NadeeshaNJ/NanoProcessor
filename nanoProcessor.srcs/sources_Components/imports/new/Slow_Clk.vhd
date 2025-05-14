library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_Out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

signal count : unsigned(25 downto 0) := "00000000000000000000000000";
signal clk_status : std_logic :='0'; 
begin
    
    Clk_out <= clk_status;
    process (clk_in) begin
        if(rising_edge(Clk_in)) then
            count <= count + 1;
            if(count = "10111110101111000010000000") then
                clk_status <= not clk_status;
                count <= "00000000000000000000000000";
            end if;
        end if;
    end process;
    
end Behavioral;
