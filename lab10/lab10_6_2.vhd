LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab10_6_2 IS
	PORT
	(T :IN STD_LOGIC;
	Q :INOUT STD_LOGIC;
	NQ :INOUT STD_LOGIC);
END lab10_6_2;

ARCHITECTURE behav OF lab10_6_2 IS
BEGIN
process(T)begin
	if(T'event and T='1') then
		Q<=not(Q);
	end if;
end process;
NQ <= not(Q);
END behav;
