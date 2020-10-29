LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY quirkydecr IS
	PORT
	(a : in std_logic_vector(5 downto 0);
	en : in std_logic;
	q : out std_logic_vector(63 downto 0)
);
END quirkydecr;
ARCHITECTURE squad OF quirkydecr IS
signal b : std_logic_vector(7 downto 0);
component kinkydecr
PORT
	(a : in std_logic_vector(2 downto 0);
	en : in std_logic;
	q : out std_logic_vector(7 downto 0)); 
end component;
BEGIN
	s0: kinkydecr port map(a(5 downto 3), en, b(7 downto 0));
	s1: kinkydecr port map(a(2 downto 0), b(0), q(7 downto 0));
	s2: kinkydecr port map(a(2 downto 0), b(1), q(15 downto 8));
	s3: kinkydecr port map(a(2 downto 0), b(2), q(23 downto 16));
	s4: kinkydecr port map(a(2 downto 0), b(3), q(31 downto 24));
	s5: kinkydecr port map(a(2 downto 0), b(4), q(39 downto 32));
	s6: kinkydecr port map(a(2 downto 0), b(5), q(47 downto 40));
	s7: kinkydecr port map(a(2 downto 0), b(6), q(55 downto 48));
	s8: kinkydecr port map(a(2 downto 0), b(7), q(63 downto 56));
	END squad;
configuration con of quirkydecr is
	for squad
		for s0, s1, s2, s3, s4, s5, s6, s7, s8: kinkydecr
			use entity work.kinkydecr(behav); 
		end for;
	end for;
end con;
