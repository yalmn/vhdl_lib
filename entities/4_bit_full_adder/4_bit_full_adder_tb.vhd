--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:17:19 07/12/2025
-- Design Name:   
-- Module Name:   /home/ise/XilinixShare/Projects/A2/vier_bit_voll_addierer_tb.vhd
-- Project Name:  A2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vier_bit_voll_addierer
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
 
ENTITY vier_bit_voll_addierer_tb IS
END vier_bit_voll_addierer_tb;
 
ARCHITECTURE behavior OF vier_bit_voll_addierer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vier_bit_voll_addierer
    PORT(
         a0 : IN  std_logic;
         b0 : IN  std_logic;
         a1 : IN  std_logic;
         b1 : IN  std_logic;
         a2 : IN  std_logic;
         b2 : IN  std_logic;
         a3 : IN  std_logic;
         b3 : IN  std_logic;
         s0 : OUT  std_logic;
         s1 : OUT  std_logic;
         s2 : OUT  std_logic;
         s3 : OUT  std_logic;
         u : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal a0 : std_logic := '0';
   signal b0 : std_logic := '0';
   signal a1 : std_logic := '0';
   signal b1 : std_logic := '0';
   signal a2 : std_logic := '0';
   signal b2 : std_logic := '0';
   signal a3 : std_logic := '0';
   signal b3 : std_logic := '0';

 	--Outputs
   signal s0 : std_logic;
   signal s1 : std_logic;
   signal s2 : std_logic;
   signal s3 : std_logic;
   signal u : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vier_bit_voll_addierer PORT MAP (
          a0 => a0,
          b0 => b0,
          a1 => a1,
          b1 => b1,
          a2 => a2,
          b2 => b2,
          a3 => a3,
          b3 => b3,
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          u => u
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      -- insert stimulus here 
		
		-- Testfall 1: 0000 + 0000 = 0000, carry = 0
      a0 <= '0'; a1 <= '0'; a2 <= '0'; a3 <= '0';
      b0 <= '0'; b1 <= '0'; b2 <= '0'; b3 <= '0';
      wait for 30 ns;

      -- Testfall 2: 0001 + 0001 = 0010, carry = 0
		a0 <= '1'; a1 <= '0'; a2 <= '0'; a3 <= '0';
      b0 <= '1'; b1 <= '0'; b2 <= '0'; b3 <= '0';
      wait for 30 ns;
		
		-- Testfall 3: 0011 + 0100 = 0111, carry = 0
      a0 <= '1'; a1 <= '1'; a2 <= '0'; a3 <= '0';
      b0 <= '0'; b1 <= '0'; b2 <= '1'; b3 <= '0';
      wait for 30 ns;

      -- Testfall 4: 1111 + 0001 = 0000, carry = 1
      a0 <= '1'; a1 <= '1'; a2 <= '1'; a3 <= '1';
      b0 <= '1'; b1 <= '0'; b2 <= '0'; b3 <= '0';
      wait for 30 ns;
		  
		-- Testfall 5: 1001 + 0110 = 1111, carry = 0
      a0 <= '1'; a1 <= '0'; a2 <= '0'; a3 <= '1';
      b0 <= '0'; b1 <= '1'; b2 <= '1'; b3 <= '0';
      wait for 30 ns;

      -- Testfall 6: 1111 + 1111 = 1110, carry = 1
      a0 <= '1'; a1 <= '1'; a2 <= '1'; a3 <= '1';
      b0 <= '1'; b1 <= '1'; b2 <= '1'; b3 <= '1';
      wait for 30 ns;
		

      wait;
   end process;

END;
