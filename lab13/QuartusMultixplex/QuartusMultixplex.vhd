LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY QuartusMultixplex IS
	PORT
	(
		x :  in std_logic_vector(3 downto 0);
		e:  in std_logic;
		a : in std_logic_vector(1 downto 0);
		q, nq : inout std_logic
	);
END QuartusMultixplex;

ARCHITECTURE behav OF QuartusMultixplex IS
BEGIN
process(x, a, e)
begin
	if e = '0' then
		q <= '0';
	else
		q <= x(conv_integer(unsigned(a)));
	end if;
end process;
nq <= not q;
END behav;