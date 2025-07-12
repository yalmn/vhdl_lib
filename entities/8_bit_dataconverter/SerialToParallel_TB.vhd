--------------------------------------------------------------------------------
-- Company: 
-- Engineer: H. Yalman
--
-- Create Date:   08:22:00 07/12/2025
-- Design Name:   
-- Module Name:   /home/ise/XilinixShare/Projects/datenwandler/SerialToParallel_TB.vhd
-- Project Name:  datenwandler
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SerialToParallel
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
 
ENTITY SerialToParallel_TB IS
END SerialToParallel_TB;
 
ARCHITECTURE behavior OF SerialToParallel_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SerialToParallel
    PORT(
         clk 		: IN  	std_logic;
         rst 		: IN  	std_logic;
         ENS 		: IN  	std_logic;
         DataIN 	: IN  	std_logic;
         BYTE_OUT : OUT  	std_logic_vector(7 downto 0);
         VALID 	: OUT  	std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk 		: std_logic := '0';
   signal rst 		: std_logic := '0';
   signal ENS 		: std_logic := '0';
   signal DataIN 	: std_logic := '0';

 	--Outputs
   signal BYTE_OUT : std_logic_vector(7 downto 0);
   signal VALID    : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: SerialToParallel PORT MAP (
          clk 			=> clk,
          rst 			=> rst,
          ENS 			=> ENS,
          DataIN 		=> DataIN,
          BYTE_OUT 	=> BYTE_OUT,
          VALID 		=> VALID
        );

   -- Clock process definitions
   clk_process :process
   begin
		while true loop
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
		end loop;
   end process;
 

   -- Stimulus process
   stim_proc: process
		--variable test_byte : std_logic_vector(7 downto 0) := "10110100"; 
		variable test_byte : std_logic_vector(7 downto 0) := "10001110"; 
   begin		
      rst <= '1';
      wait for clk_period*5;
      rst <= '0';
      wait until rising_edge(clk);
		
      ENS <= '1';
      for i in 7 downto 0 loop
			wait until falling_edge(clk);
			DataIN <= test_byte(i);
      end loop;
		
		wait until rising_edge(clk);
      ENS <= '0';
		
      assert BYTE_OUT = test_byte;
      assert VALID = '1';
			 
      wait;
   end process;

END;
