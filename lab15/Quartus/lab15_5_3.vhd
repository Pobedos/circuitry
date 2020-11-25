LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_ARITH.all;
ENTITY lab15_5_3 IS
	PORT
	(
		x :  in std_logic_vector(7 downto 0);
		d :  in std_logic;
		er: in std_logic_vector(8 downto 0);
		output: out std_logic_vector(8 downto 0)
	);
END lab15_5_3;

ARCHITECTURE behav OF lab15_5_3 IS
signal sint: integer;
BEGIN
process(x, er)
begin
	for i in 0 to x'length-1 loop
		output(i) <= x(i) xor er(i);
	end loop;
	output(8) <= d xor er(8);
end process;	
END behav;
