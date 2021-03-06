library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VGA_display is port
 (
  -- Assuming 50MHz clock.If the clock is reduced then it might give the unexpected output.
  clock: in std_logic;

  -- The counter tells whether the correct position on the screen is reached where the data is to be displayed.
  hcounter: in integer range 0 to 1023;
  vcounter: in integer range 0 to 1023;

  -- Output the colour that should appear on the screen.
  pixels : out std_logic_vector(7 downto 0)
 ); end VGA_display;

architecture Behavioral of VGA_display is
 -- Intermediate register telling the exact position on display on screen.
    signal x : integer range 0 to 1023 := 100;
    signal y : integer range 0 to 1023 := 80;

    begin

  -- On every positive edge of the clock counter condition is checked,
  video_output: process(clock)
  begin
   if rising_edge (clock) then
   -- If the counter satisfy the condition, then output the colour that should appear.
    if (hcounter >= 1) and (hcounter < 480) and (vcounter >= 1) and (vcounter < 640 )
        then pixels <= x"F0";
    -- If the condition is not satisfied then the output colour will be black.
    else
     pixels <= x"00";
    end if;
   end if;
  end process;
 end Behavioral;
