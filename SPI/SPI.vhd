----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:58:32 01/13/2017 
-- Design Name: 
-- Module Name:    SPI - Behavioral 
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

entity maq_estados is
	port(
			clk_n:	in std_logic;
			clr_n:	in std_logic;
			ss_n :	out std_logic;
			miso :	in std_logic;
			mosi :   out std_logic;
			start:   in std_logic;
			pi	  :   in std_logic_vector (7 downto 0);
			po   :   out std_logic_vector (7 downto 0);
			load_n:  in std_logic
			);
end maq_estados;

architecture Behavioral of maq_estados is
	type estados is (reposo, carga, funcionamiento);
	signal reg: std_logic_vector(7 downto 0);
	signal Q_bus: estados;
	signal carga_realizada, funcionamiento_realizado: std_logic;
	signal unused: std_logic;
	signal habilita_n: std_logic;
begin
	-- Lógica de salida
	salida: process (clk_n, clr_n)
	variable counter: integer := 0;
	begin
		if clr_n= '0' then
			--Q_bus <= reposo;
			carga_realizada <= '0';
			funcionamiento_realizado <= '0';
			habilita_n <= '1';
			unused <= '0';
			reg<= (others=>'0');
			
		elsif falling_edge(clk_n) then
			case (Q_bus) is
				when reposo =>
					if start = '1' then
						habilita_n <= '0';
					--else
					--	habilita_n <= '1';--habilita_n;
					end if;

				when carga =>
				if load_n = '0' and counter = 0 then
					reg <= pi;
				end if;
					counter := 8;
					carga_realizada <= '1';
				
					
				when funcionamiento =>
					if counter=0 then
						funcionamiento_realizado <= '1';
						habilita_n <= '1';
					else
						reg <=  miso & reg(reg'high downto 1);
						counter := counter-1;
					end if;
				
				when others =>
						unused <= '1';
						
			end case;
			
		end if;
		
	end process;
	
	sig_estado: process (clr_n, habilita_n,carga_realizada, funcionamiento_realizado)
	
	begin
		if clr_n= '0' then
			Q_bus<= reposo;
		else
			case (Q_bus) is
				when reposo =>
					if habilita_n ='0' then 
						Q_bus <= carga;
					else
						Q_bus <= reposo;
					end if;
					
				when carga =>
					if carga_realizada = '1' then
						Q_bus <= funcionamiento;
					else 
						Q_bus <= carga;
					end if;
					
				when funcionamiento =>
					if funcionamiento_realizado = '1' then
						Q_bus <= reposo;
					else
						Q_bus <= funcionamiento;
					end if;
					
				end case;
			end if;
		end process;
	
	mosi <= reg(0);
	ss_n <= habilita_n;
	po <= reg;
end Behavioral;

