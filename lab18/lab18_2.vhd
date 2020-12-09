LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY lab18_2 IS
	PORT
	(A :IN STD_LOGIC_VECTOR(1 downto 0);
	D :IN STD_LOGIC;
	C :IN STD_LOGIC;
	Q :OUT STD_LOGIC);
	END lab18_2;

ARCHITECTURE behav OF lab18_2 IS
SIGNAL dL : std_logic_vector(3 downto 0);
BEGIN
process(A, D, C)begin
	if(C'event and C = '1') then
		dL(conv_integer(unsigned(A))) <= D;
	end if;
end process;
Q <= dL(conv_integer(unsigned(A)));
END behav;

