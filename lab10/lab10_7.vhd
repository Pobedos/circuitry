LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab10_7 IS
	PORT
	(JK :IN STD_LOGIC;
	C :IN STD_LOGIC;
	R :IN STD_LOGIC;
	Q0 :INOUT STD_LOGIC;
	Q1 :INOUT STD_LOGIC;
	Q2 :INOUT STD_LOGIC;
	Q3 :INOUT STD_LOGIC);
END lab10_7;

ARCHITECTURE behav OF lab10_7 IS
BEGIN
process(JK, C, R)begin
	if(R='0') then
		Q0<='0';
		Q1<='0';
		Q2<='0';
		Q3<='0';
	elsif(C'event and C='1') then
		if(JK='1') then
			if(Q0='1') then
				if(Q1='1') then
					if(Q2='1') then
						Q3<=not(Q3);
					end if;
					Q2<=not(Q2);
				end if;
				Q1<=not(Q1);
			end if;
			Q0<=not(Q0);
		end if;
	end if;
	end process;
END behav;