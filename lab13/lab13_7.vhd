LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY lab13_7 IS
	PORT
	(
		x :  in std_logic_vector(1 downto 0);
		e:  in std_logic;
		f : out std_logic_vector(3 downto 0)
	);
END lab13_7;

ARCHITECTURE behav OF lab13_7 IS
BEGIN
process(x, e)
begin
	if e = '0' then
		f <= "0000";
	else
		case x is
			when "00" => f <= "0001";
			when "01" => f <= "0010";
			when "10" => f <= "0100";
			when "11" => f <= "1000";
			when others => f <= "0000";
		end case;
	end if;
end process;
END behav;
