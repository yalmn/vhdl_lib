----------------------------------------------------------------------------------
-- Company: 
-- Engineer: H. Yalman
-- 
-- Create Date:    08:05:41 07/12/2025 
-- Design Name: 
-- Module Name:    SerialToParallel - Behavioral 
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

entity SerialToParallel is
    Port ( clk 		: in  	STD_LOGIC;
           rst 		: in  	STD_LOGIC;
           ENS 		: in  	STD_LOGIC;
           DataIN 	: in  	STD_LOGIC;
           BYTE_OUT 	: out  	STD_LOGIC_VECTOR(7 downto 0);
           VALID 		: out  	STD_LOGIC);
end SerialToParallel;

architecture Behavioral of SerialToParallel is
	signal shift_register		:	STD_LOGIC_VECTOR(7 downto 0)		:=	(others => '0');
	signal bit_counter			:	integer range 0 to 7					:= 0;
	signal output_register		:	STD_LOGIC_VECTOR(7 downto 0)		:=	(others => '0');
begin
	ShiftProcess:	process(clk, rst)
		variable new_shift : STD_LOGIC_VECTOR(7 downto 0);
	begin
		if rst = '1' then
			shift_register		<=		(others => '0');
			bit_counter			<=		0;
			output_register	<=		(others => '0');
			VALID 				<= 	'0';

		elsif	rising_edge(clk) then
			if ENS = '1' then
				new_shift := shift_register(6 downto 0) & DataIN;
				--new_shift := DataIN & shift_register(7 downto 1);
				shift_register <= new_shift;
				--shift_register <= shift_register(6 downto 0) & DataIN;
				
				if bit_counter  = 7 then
					bit_counter 		<= 	0;
					output_register 	<= 	new_shift;
					VALID 				<= 	'1';
				else
					bit_counter			<=		bit_counter + 1;
					VALID					<=		'0';
				end if;
			else
				VALID 	<= '0';
			end if;
		end if;
	end process ShiftProcess;
	
	BYTE_OUT		<= output_register;
	
end Behavioral;