----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:48 01/14/2017 
-- Design Name: 
-- Module Name:    Bin2BCD - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bin2BCD is
	generic(
		width: positive:=8
		);
	port(
		bin	   : in std_logic_vector(width-1 downto 0);
		unidades	: out std_logic_vector(3 downto 0);
		decenas	: out std_logic_vector(3 downto 0);
		centenas : out std_logic_vector(3 downto 0)
		);
end Bin2BCD;

architecture Behavioral of Bin2BCD is
	variable decimal: integer := 0;
begin
	process(bin)
	begin
		decimal:=bin(7)*(2**7)+bin(6)*(2**6)+bin(5)*(2**5)+bin(4)*(2**4)+bin(3)*(2**3)+bin(2)*(2**2)+bin(1)*(2)+bin(0);
	end process;
end Behavioral;

