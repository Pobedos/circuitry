LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY lab12_7 IS
	PORT
	(
		r :  in std_logic_vector(7 downto 0);
		e1:  in std_logic;
		a : inout std_logic_vector(7 downto 0)
	);
END lab12_7;

ARCHITECTURE behav OF lab12_7 IS
signal t : integer;
BEGIN
process(r, e1)
begin
		a(0) <= r(0) and not(r(1)) and not(r(2)) and not(r(3)) and not(r(4)) and not(r(5)) and not(r(6)) and not(r(7)) and e1;
		a(1) <= r(1) and not(r(2)) and not(r(3)) and not(r(4)) and not(r(5)) and not(r(6)) and not(r(7)) and e1;
		a(2) <= r(2) and not(r(3)) and not(r(4)) and not(r(5)) and not(r(6)) and not(r(7)) and e1;
		a(3) <= r(3) and not(r(4)) and not(r(5)) and not(r(6)) and not(r(7)) and e1;
		a(4) <= r(4) and not(r(5)) and not(r(6)) and not(r(7)) and e1;
		a(5) <= r(5) and not(r(6)) and not(r(7)) and e1;
		a(6) <= r(6) and not(r(7)) and e1;
		a(7) <= r(7) and e1;
end process;	
END behav;
