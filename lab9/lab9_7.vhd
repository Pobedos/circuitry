LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab9_7 IS
	PORT
	(C :IN STD_LOGIC;
	D :IN STD_LOGIC;
	R :IN STD_LOGIC;
	q1,q2,q3,q4 :OUT STD_LOGIC
	);
END lab9_7;

ARCHITECTURE behav OF lab9_7 IS
SIGNAL d1, d2, d3, d4: STD_LOGIC;
BEGIN
process(C,R,D)begin
	if (R='0') then 
		d1<='0';
		d3<='0';
	elsif (rising_edge(C)) then
		d3<=d2;
		d1<=D;
	else
		d3<=d3;
		d1<=d1;
	end if;
	if (R='0') then
		d2<='0';
		d4<='0';
	elsif (falling_edge(C)) then
		d4<=d3;
		d2<=d1;
	else
		d4<=d4;
		d2<=d2;
	end if;
	end process;
q4 <= d4;
q3 <= d3;
q2 <= d2;
q1 <= d1;
END behav;

