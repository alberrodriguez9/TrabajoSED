----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:57 01/16/2017 
-- Design Name: 
-- Module Name:    decoder_unit - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY decoder_unit IS
PORT (
	code : IN std_logic_vector(1 DOWNTO 0);
	led : OUT std_logic_vector(7 DOWNTO 0)
);
END ENTITY decoder_unit;

ARCHITECTURE dataflow OF decoder_unit IS
BEGIN
	WITH code SELECT
		led <= 	"11110010" WHEN "00",
					"00111000" WHEN "01",
					"11100100" WHEN "10",
					"10000010" WHEN "11",
					"11111100" WHEN others;
	
END ARCHITECTURE dataflow;
