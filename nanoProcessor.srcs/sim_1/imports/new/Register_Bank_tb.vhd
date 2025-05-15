----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2025 09:41:57 AM
-- Design Name: 
-- Module Name: Register_Bank_tb - Behavioral
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

use work.Reg_types.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Bank_tb is
--  Port ( );
end Register_Bank_tb;

architecture Behavioral of Register_Bank_tb is
    component Register_Bank
        Port ( Clk : in STD_LOGIC;
               Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
               Reset : in STD_LOGIC;
               input : in STD_LOGIC_VECTOR (3 downto 0);
               Data_Bus : out Reg_array);
   end component;

signal Clk      : STD_LOGIC := '0';
signal Reg_EN   : STD_LOGIC_VECTOR(2 downto 0):= "000";
signal Reset    : STD_LOGIC := '0';
signal input    : STD_LOGIC_VECTOR(3 downto 0):= "0000";
signal Data_Bus : Reg_array;   

begin
    UUT: Register_Bank
        Port map (
            Clk       => Clk,
            Reg_EN    => Reg_EN,
            Reset     => Reset,
            input     => input,
            Data_Bus  => Data_Bus);
    --process begin
    --    clk <= not clk;
    --    wait for 5ns;
    --end process;
    clock: process
        begin
            Clk <= '0';
            wait for 5ns;
            Clk <= '1';
            wait for 5ns;
        end process;
    
    process begin
        input <= "1101";        
        Reg_EN <= "001";
        WAIT for 100ns;
        
        input <= "1111";        
        Reg_EN <= "010";
        WAIT for 100ns;
        
        input <= "0001";        
        Reg_EN <= "011";
        WAIT for 100ns;
        
        input <= "1101";        
        Reg_EN <= "100";
        WAIT for 100ns;
        
        input <= "1101";        
        Reg_EN <= "101";
        WAIT for 100ns;
        
        input <= "1101";        
        Reg_EN <= "110";
        WAIT for 100ns;
                                
        input <= "1101";        
        Reg_EN <= "111";
        WAIT for 100ns;
        
        Reset <= '1';
        
        WAIT for 100ns;
        
    end process;

end Behavioral;
