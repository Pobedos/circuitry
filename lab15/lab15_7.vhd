LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY lab15_7 IS
	PORT
	(X :IN STD_LOGIC_VECTOR(3 downto 1);
	RX :OUT STD_LOGIC;
	a :OUT STD_LOGIC_VECTOR(1 downto 0));
	END lab15_7;

ARCHITECTURE behav OF lab15_7 IS
BEGIN
process(X)begin
	case X is
		when "000" => a <="00";
		when "001" => a <="01";
		when "010" => a <="10";
		when "011" => a <="11";
		when "100" => a <="11";
		when "101" => a <="10";
		when "110" => a <="01";
		when "111" => a <="00";
		when others => a <="00";
	end case;
	if(conv_integer(unsigned(X))<3 or conv_integer(unsigned(X))=4) then
		RX <= '0';
	else
		RX <= '1';
	end if;
end process;
END behav;
