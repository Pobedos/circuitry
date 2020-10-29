LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY superdecr IS
	PORT
	(a : in std_logic_vector(3 downto 0);
	en : in std_logic;
	q : out std_logic_vector(15 downto 0)
);
END superdecr;
ARCHITECTURE squad OF superdecr IS
signal b : std_logic_vector(3 downto 0);
component decriptor
PORT
	(a : in std_logic_vector(1 downto 0);
	en : in std_logic;
	q : out std_logic_vector(3 downto 0)); 
end component;
BEGIN
	s0: decriptor port map(a(3 downto 2), en, b(3 downto 0));
	s1: decriptor port map(a(1 downto 0), b(0), q(3 downto 0));
	s2: decriptor port map(a(1 downto 0), b(1), q(7 downto 4));
	s3: decriptor port map(a(1 downto 0), b(2), q(11 downto 8));
	s4: decriptor port map(a(1 downto 0), b(3), q(15 downto 12));
END squad;
configuration con of superdecr is
	for squad
		for s0, s1, s2, s3, s4: decriptor
			use entity work.decriptor(behav); 
		end for;
	end for;
end con;
