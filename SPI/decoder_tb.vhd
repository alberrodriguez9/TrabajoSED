--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:57:39 01/16/2017
-- Design Name:   
-- Module Name:   C:/Users/jorge/Desktop/TrabajoSED/SPI/decoder_tb.vhd
-- Project Name:  SPI
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder
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

ENTITY decoder_decoder_tb_vhd_tb IS
END decoder_decoder_tb_vhd_tb;

ARCHITECTURE behavior OF decoder_decoder_tb_vhd_tb IS

COMPONENT decoder
PORT(
		code : IN std_logic_vector(3 DOWNTO 0);
		led : OUT std_logic_vector(7 DOWNTO 0)
);
END COMPONENT;

SIGNAL code : std_logic_vector(3 DOWNTO 0);
SIGNAL led : std_logic_vector(7 DOWNTO 0);

	TYPE vtest is record
		code : std_logic_vector(3 DOWNTO 0);
		led : std_logic_vector(7 DOWNTO 0);
	END RECORD;

	TYPE vtest_vector IS ARRAY (natural RANGE <>) OF vtest;
	CONSTANT test: vtest_vector := (
			(code => "0000", led => "00000011"),
			(code => "0001", led => "10011111"),
			(code => "0010", led => "00100101"),
			(code => "0011", led => "00001101"),
			(code => "0100", led => "10011001"),
			(code => "0101", led => "01001001"),
			(code => "0110", led => "01000001"),
			(code => "0111", led => "00011111"),
			(code => "1000", led => "00000001"),
			(code => "1001", led => "00001001"),
			(code => "1010", led => "11111101"),
			(code => "1011", led => "11111101"),
			(code => "1100", led => "11111101"),
			(code => "1101", led => "11111101"),
			(code => "1110", led => "11111101"),
			(code => "1111", led => "11111101")
	);

BEGIN
	uut: decoder PORT MAP(
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