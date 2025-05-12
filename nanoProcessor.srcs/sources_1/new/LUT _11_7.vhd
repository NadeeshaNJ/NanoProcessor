library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_11_7 is
    Port ( Clk : in STD_LOGIC;
           number : in STD_LOGIC_VECTOR (3 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_11_7;

architecture Behavioral of LUT_11_7 is
  type rom_type is array (0 to 10) of std_logic_vector(6 downto 0);
   signal sevenSegment_ROM : rom_type := (
       "1000000", -- 0
       "1111001", -- 1
       "0100100", -- 2
       "0110000", -- 3
       "0011001", -- 4
       "0010010", -- 5
       "0000010", -- 6
       "1111000", -- 7
       "0000000", -- 8
       --"0010000", -- 9
       --"0001000", -- A
       --"0000011", -- b
       --"1000110", -- C
       --"0100001", -- d
       --"0000110", -- E
       --"0001110", -- F
       "0111111",  -- 16: minus sign '-'
       "1111111"  -- shows nothing
   );
   signal count : integer := 1;
   signal clk_status : std_logic :='0'; 
   signal Clk_out : std_logic:= '1';
   signal digit0  : integer range 0 to 15 := 0;
   signal is_negative : boolean := false;

begin

   -- Clock divider and digit index rotator (roughly 1kHz)
   process(clk)
   begin
       if rising_edge(clk) then
           count <= count +1;
           if(count = 5) then
               clk_status<= not clk_status;
               Clk_out <= clk_status;
               count <=1;
           end if;
       end if;
   end process;

   -- Decode number into digits and sign
   process(number)
       variable num_signed : integer;
   begin
       num_signed := to_integer(signed(number));

       if num_signed < 0 then
           is_negative <= true;
           num_signed := -num_signed;
       else
           is_negative <= false;
       end if;

       digit0 <= num_signed;
   end process;

   -- Multiplexing logic
   process(Clk_out, digit0, is_negative)
   begin
       case Clk_out is
           when '0' =>  -- Rightmost digit (LSB)
               anode <= "1110";
               S_7seg <= sevenSegment_ROM(digit0);
           when '1' =>  -- Next digit (MSB or minus sign)
               anode <= "1101";
               if is_negative then
                   S_7seg <= sevenSegment_ROM(9); -- minus sign
               else   
                   S_7seg <= sevenSegment_ROM(10);  --shows nothing
               end if;
           when others => --turn off unused
            anode <= "1111";
            S_7seg <= "1111111";
           end case;
   end process;

end Behavioral;