----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:03:35 07/12/2025 
-- Design Name: 
-- Module Name:    vier_bit_voll_addierer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vier_bit_voll_addierer is
    Port ( a0,b0 : in  STD_LOGIC;
           a1,b1 : in  STD_LOGIC;
           a2,b2 : in  STD_LOGIC;
           a3,b3 : in  STD_LOGIC;
           s0 : out  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC;
           s3, u : out  STD_LOGIC);
end vier_bit_voll_addierer;

architecture Behavioral of vier_bit_voll_addierer is

	component halb_addierer
		Port ( a,b : in  STD_LOGIC;
           s,cout : out  STD_LOGIC
		);
	end component;
	
	component voll_addierer 
		Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC
		);
	end component;
	
	 signal c1, c2, c3 : STD_LOGIC; -- Verkettung der Uebertraege

begin

	HA0: halb_addierer
		port map (
			a		=>	a0,
			b		=>	b0,
			s		=>	s0,
			cout 	=>	c1
		);
		
	VA1: voll_addierer
		port map (
			a    => a1,
         b    => b1,
         cin  => c1,
         s    => s1,
         cout => c2
		);
		
	VA2: voll_addierer
		port map (
			a    => a2,
         b    => b2,
         cin  => c2,
         s    => s2,
         cout => c3
		);
		
	VA3: voll_addierer
		port map (
			a    => a3,
         b    => b3,
         cin  => c3,
         s    => s3,
         cout => u
		);


end Behavioral;

