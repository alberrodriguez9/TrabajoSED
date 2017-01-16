--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:18:13 01/16/2017
-- Design Name:   
-- Module Name:   C:/Users/jorge/Desktop/TrabajoSED/SPI/decoder_letter_tb.vhd
-- Project Name:  SPI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder_letter
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
USE ieee.numeric_std.ALL;

ENTITY decoder_letter_tb IS
END decoder_letter_tb;

ARCHITECTURE behavior OF decoder_letter_tb IS

COMPONENT decoder_letter
PORT(
		code : IN std_logic_vector(1 DOWNTO 0);
		led : OUT std_logic_vector(7 DOWNTO 0)
);
END COMPONENT;

SIGNAL code : std_logic_vector(1 DOWNTO 0);
SIGNAL led : std_logic_vector(7 DOWNTO 0);

	TYPE vtest is record
		code : std_logic_vector(1 DOWNTO 0);
		led : std_logic_vector(7 DOWNTO 0);
	END RECORD;

	TYPE vtest_vector IS ARRAY (natural RANGE <>) OF vtest;
	CONSTANT test: vtest_vector := (
			(code => "00", led => "11100010"),
			(code => "01", led => "11100000"),
			(code => "10", led => "10000100"),
			(code => "11", led => "00110000")
	);

BEGIN
	uut: decoder_letter PORT MAP(
		code => code,
		led => led
	);
	
	tb: PROCESS
	BEGIN
		FOR i IN 0 TO test'HIGH LOOP
			code <= test(i).code;
			WAIT FOR 20 ns;
			ASSERT led = test(i).led
				REPORT "Salida incorrecta."
				SEVERITY FAILURE;
		END LOOP;
		
		ASSERT false
			REPORT "Simulación finalizada. Test superado."
			SEVERITY FAILURE;
	END PROCESS;
END;