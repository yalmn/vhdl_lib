----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:41:32 07/12/2025 
-- Design Name: 
-- Module Name:    halb_addierer - Behavioral 
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

entity halb_addierer is
    Port ( a,b : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end halb_addierer;

architecture Behavioral of halb_addierer is

begin
	s  	<= a xor b;
   cout 	<= a and b;
end Behavioral;

