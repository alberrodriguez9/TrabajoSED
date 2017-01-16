----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:03 01/16/2017 
-- Design Name: 
-- Module Name:    decoder - Behavioral 
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
ENTITY decoder IS
PORT (
	code : IN std_logic_vector(3 DOWNTO 0);
	led : OUT std_logic_vector(7 DOWNTO 0)
);
END ENTITY decoder;

ARCHITECTURE dataflow OF decoder IS
BEGIN
	WITH code SELECT
		led <=   "00000011" WHEN "0000",
					"10011111" WHEN "0001",
					"00100101" WHEN "0010",
					"00001101" WHEN "0011",
					"10011001" WHEN "0100",
					"01001001" WHEN "0101",
					"01000001" WHEN "0110",
					"00011111" WHEN "0111",
					"00000001" WHEN "1000",
					"00001001" WHEN "1001",
					"11111101" WHEN others;
	
END ARCHITECTURE dataflow;