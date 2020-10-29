LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_ARITH.all;
ENTITY lab11_3 IS
	PORT
	(
		a :  in std_logic_vector(5 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
END lab11_3;

ARCHITECTURE behav OF lab11_3 IS
signal sint: integer;
BEGIN
process(a)
begin
	for i in 0 to q'length-1 loop
		if (conv_integer(unsigned(a)) = i) then
			q(i) <= '1';
		else 
			q(i) <= '0';
		end if;
	end loop;
end process;	
END behav;
