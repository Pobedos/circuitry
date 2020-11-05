LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab12_4 IS
	PORT
	(a : in std_logic_vector(63 downto 0);
	en : in std_logic;
	q : out std_logic_vector(5 downto 0);
	g : out std_logic);
END lab12_4;
ARCHITECTURE behav OF lab12_4 IS
component lab12_3
PORT
	(r : in std_logic_vector(7 downto 0);
	e1 : in std_logic;
	a : inout std_logic_vector(2 downto 0); 
	e0, g : inout std_logic);
end component;
signal tg, te0, ten: std_logic_vector(8 downto 1);
signal tq1, tq2, tq3, tq4, tq5, tq6, tq7, tq8: std_logic_vector(2 downto 0);
BEGIN
	s1: lab12_3 port map(a(7 downto 0), ten(1), tq1(2 downto 0), te0(1), tg(1));
	s2: lab12_3 port map(a(15 downto 8), ten(2), tq2(2 downto 0), te0(2), tg(2));
	s3: lab12_3 port map(a(23 downto 16), ten(3), tq3(2 downto 0), te0(3), tg(3));
	s4: lab12_3 port map(a(31 downto 24), ten(4), tq4(2 downto 0), te0(4), tg(4));
	s5: lab12_3 port map(a(39 downto 32), ten(5), tq5(2 downto 0), te0(5), tg(5));
	s6: lab12_3 port map(a(47 downto 40), ten(6), tq6(2 downto 0), te0(6), tg(6));
	s7: lab12_3 port map(a(55 downto 48), ten(7), tq7(2 downto 0), te0(7), tg(7));
	s8: lab12_3 port map(a(63 downto 56), ten(8), tq8(2 downto 0), te0(8), tg(8));
	ten(8)<=en;
	ten(7)<=te0(8);
	ten(6)<=te0(8) and te0(7);
	ten(5)<=te0(8) and te0(7) and te0(6);
	ten(4)<=te0(8) and te0(7) and te0(6) and te0(5);
	ten(3)<=te0(8) and te0(7) and te0(6) and te0(5) and te0(4);
	ten(2)<=te0(8) and te0(7) and te0(6) and te0(5) and te0(4) and te0(3);
	ten(1)<=te0(8) and te0(7) and te0(6) and te0(5) and te0(4) and te0(3) and te0(2);
	q(2 downto 0)<=tq8(2 downto 0) or tq7(2 downto 0) or tq6(2 downto 0) or tq5(2 downto 0) or tq4(2 downto 0) or tq3(2 downto 0) or tq2(2 downto 0) or tq1(2 downto 0);
	q(5)<=tg(5) or tg(6) or tg(7) or tg(8);
	q(4)<=tg(3) or tg(4) or tg(7) or tg(8);
	q(3)<=tg(2) or tg(4) or tg(6) or tg(8);
	g <= tg(1) or tg(2) or tg(3) or tg(4) or tg(5) or tg(6) or tg(7) or tg(8);
END behav;
configuration con of lab12_4 is
	for behav
		for s1, s2, s3, s4, s5, s6, s7, s8: lab12_3
			use entity work.lab12_3(behav);
		end for;
	end for;
end;
