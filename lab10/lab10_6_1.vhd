LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab10_6_1 IS
	PORT
	(R :IN STD_LOGIC;
	J :IN STD_LOGIC;
	K :IN STD_LOGIC;
	S :IN STD_LOGIC;
	Q :INOUT STD_LOGIC;
	NQ :INOUT STD_LOGIC);
END lab10_6_1;

ARCHITECTURE behav OF lab10_6_1 IS
SIGNAL T: STD_LOGIC;
BEGIN
process(J, K, T, S, R)begin
	if((K='0' and J='1') or S='0') then
		Q<='1';
	elsif((K='1' and J='0') or R='0') then
		Q<='0';
	elsif(T'event and T='1') then
		Q<=not(Q);
	end if;
end process;
T<=J and K;
NQ<=not(Q);
END behav;
