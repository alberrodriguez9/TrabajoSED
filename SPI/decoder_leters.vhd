----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:21 01/16/2017 
-- Design Name: 
-- Module Name:    decoder_leters - Behavioral 
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
ENTITY decoder_letter IS
PORT (
	code : IN std_logic_vector(1 DOWNTO 0);
	led : OUT std_logic_vector(7 DOWNTO 0)
);
END ENTITY decoder_letter;

ARCHITECTURE dataflow OF decoder_letter IS
BEGIN
	WITH code SELECT
		led <= 	"11100010" WHEN "00",
					"11100000" WHEN "01",
					"10000100" WHEN "10",
					"00110000" WHEN "11",
					"11111100" WHEN others;
	
END ARCHITECTURE dataflow;