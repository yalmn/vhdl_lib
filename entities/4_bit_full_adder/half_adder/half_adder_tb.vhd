--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:42:32 07/12/2025
-- Design Name:   
-- Module Name:   /home/ise/XilinixShare/Projects/A2/halb_addierer_tb.vhd
-- Project Name:  A2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: halb_addierer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY halb_addierer_tb IS
END halb_addierer_tb;
 
ARCHITECTURE behavior OF halb_addierer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT halb_addierer
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: halb_addierer PORT MAP (
          a => a,
          b => b,
          s => s,
          cout => cout
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;
		-- 0 0 | 0 0
		a <= '0';
		b <= '0';
		assert (s = '0' and cout = '0');
		
		wait for 10 ns;
		
		-- 1 0 | 1 0
		a <= '1';
		b <= '0';
		assert (s = '1' and cout = '0');
		
		wait for 10 ns;
		
		-- 0 1 | 1 0
		a <= '0';
		b <= '1';
		assert (s = '1' and cout = '0');
		
		wait for 10 ns;
		
		-- 1 1 | 0 1
		a <= '1';
		b <= '1';
		assert (s = '0' and cout = '1');
		
		wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
