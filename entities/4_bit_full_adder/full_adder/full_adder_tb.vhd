--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:53:46 07/12/2025
-- Design Name:   
-- Module Name:   /home/ise/XilinixShare/Projects/A2/voll_addierer_tb.vhd
-- Project Name:  A2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: voll_addierer
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
 
ENTITY voll_addierer_tb IS
END voll_addierer_tb;
 
ARCHITECTURE behavior OF voll_addierer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT voll_addierer
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: voll_addierer PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s => s,
          cout => cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;	
 
		-- a	b	cin 	|	s	cout
		-- 0	0	0		|	0	0
		a 		<= '0';
		b 		<= '0';
		cin 	<= '0';
		assert (s = '0' and cout = '0');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 0	0	1		|	1	0
		a 		<= '0';
		b 		<= '0';
		cin 	<= '1';
		assert (s = '1' and cout = '0');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 0	1	0		|	1	0
		a 		<= '0';
		b 		<= '1';
		cin 	<= '0';
		assert (s = '1' and cout = '0');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 0	1	1		|	0	1
		a 		<= '0';
		b 		<= '1';
		cin 	<= '1';
		assert (s = '0' and cout = '1');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 1	0	0		|	1	0
		a 		<= '1';
		b 		<= '0';
		cin 	<= '0';
		assert (s = '1' and cout = '0');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 1	0	1		|	0	1
		a 		<= '1';
		b 		<= '0';
		cin 	<= '1';
		assert (s = '0' and cout = '1');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 1	1	0		|	0	1
		a 		<= '1';
		b 		<= '1';
		cin 	<= '0';
		assert (s = '0' and cout = '1');
		wait for 10 ns;
		
		-- a	b	cin 	|	s	cout
		-- 1	1	1		|	1	1
		a 		<= '1';
		b 		<= '1';
		cin 	<= '1';
		assert (s = '1' and cout = '1');
		wait for 10 ns;

      wait;
   end process;

END;
