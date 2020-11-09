LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab13_4_2 IS
	PORT
	(
		x :  in std_logic_vector(63 downto 0);
		e:  in std_logic;
		a : in std_logic_vector(5 downto 0);
		q, nq : inout std_logic
	);
END lab13_4_2;
ARCHITECTURE behav OF lab13_4_2 IS
component lab13_4_1
PORT
	(
		x :  in std_logic_vector(15 downto 0);
		e:  in std_logic;
		a : in std_logic_vector(3 downto 0);
		q, nq : inout std_logic
	);
end component;
component lab13_2
PORT
	(
		x :  in std_logic_vector(3 downto 0);
		e:  in std_logic;
		a : in std_logic_vector(1 downto 0);
		q, nq : inout std_logic
	);
end component;
signal sig: std_logic_vector(3 downto 0);
BEGIN
	m1: lab13_4_1 port map(x(15 downto 0), e, a(3 downto 0), sig(0));
	m2: lab13_4_1 port map(x(31 downto 16), e, a(3 downto 0), sig(1));
	m3: lab13_4_1 port map(x(47 downto 32), e, a(3 downto 0), sig(2));
	m4: lab13_4_1 port map(x(63 downto 48), e, a(3 downto 0), sig(3));
	m5: lab13_2 port map(sig(3 downto 0), e, a(5 downto 4), q);
	nq <= not q;
END behav;
configuration con of lab13_4_2 is
	for behav
		for m1, m2, m3, m4: lab13_4_1
			use entity work.lab13_4_1(behav);
		end for;
		for m5: lab13_2
			use entity work.lab13_2(behav);
		end for;
	end for;
end;

