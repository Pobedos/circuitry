LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab12_3 IS
	PORT
	(
		r :  in std_logic_vector(7 downto 0);
		e1:  in std_logic;
		a : inout std_logic_vector(2 downto 0);
		e0, g : inout std_logic
	);
END lab12_3;

ARCHITECTURE behav OF lab12_3 IS
BEGIN
process(r, e1)
begin
	a(2) <= (r(7) or r(6) or r(5) or r(4)) and e1;
	a(1) <= (r(7) or r(6) or (not(r(5)) and not(r(4)) and r(3)) or (not(r(5)) and not(r(4)) and r(2))) and e1;
	a(0) <= (r(7) or (not(r(6)) and r(5)) or (not(r(6)) and not(r(4)) and r(3)) or (not(r(6)) and not(r(4)) and not(r(2)) and r(1))) and e1;
	e0 <= not(r(7)) and not(r(6)) and not(r(5)) and not(r(4)) and not(r(3)) and not(r(2)) and not(r(1)) and not(r(0)) and e1;
	g <= (r(7) or r(6) or r(5) or r(4) or r(3) or r(2) or r(1)) and e1;
	
end process;	
END behav;
