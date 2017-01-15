--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:10 01/13/2017
-- Design Name:   
-- Module Name:   /home/alberto/SPI/SPI_tb.vhd
-- Project Name:  SPI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: maq_estados
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
 
ENTITY SPI_tb IS
END SPI_tb;
 
ARCHITECTURE behavior OF SPI_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maq_estados
    PORT(
         clk_n : IN  std_logic;
         clr_n : IN  std_logic;
         ss_n : OUT  std_logic;
         miso : IN  std_logic;
         mosi : OUT  std_logic;
         start : IN  std_logic;
         pi : IN  std_logic_vector(7 downto 0);
         po : OUT  std_logic_vector(7 downto 0);
			load_n:  in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_n : std_logic := '0';
   signal clr_n : std_logic := '0';
   signal miso : std_logic := '0';
   signal start : std_logic := '0';
   signal pi : std_logic_vector(7 downto 0) := (others => 'U');
	signal load_n:  std_logic := '1';

 	--Outputs
   signal ss_n : std_logic;
   signal mosi : std_logic;
   signal po : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_n_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maq_estados PORT MAP (
          clk_n => clk_n,
          clr_n => clr_n,
          ss_n => ss_n,
          miso => miso,
          mosi => mosi,
          start => start,
          pi => pi,
          po => po,
			 load_n => load_n
        );

   -- Clock process definitions
   clk_n_process :process
   begin
		clk_n <= '0';
		wait for clk_n_period/2;
		clk_n <= '1';
		wait for clk_n_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			clr_n <= '0';
      wait for clk_n_period*2;

      -- insert stimulus here 
		clr_n <= '1';
		wait for clk_n_period/2;
		pi <= (others =>'1');
		load_n <= '0';
		start <= '1';
		wait for clk_n_period;
		start <= '0';
		wait for clk_n_period*10;
		clr_n <= '0';
		wait for clk_n_period;
		clr_n <= '1';
		pi <= "10101010";
		wait for clk_n_period/2;
		start <= '1';
		wait for clk_n_period;
		start <= '0';
      --wait;
   end process;

END;
