LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY megadecr IS
	PORT
	(a : in std_logic_vector(5 downto 0);
	en : in std_logic;
	q : out std_logic_vector(63 downto 0)
);
END megadecr;
ARCHITECTURE squad OF megadecr IS
signal b : std_logic_vector(3 downto 0);
component superdecr
PORT
	(a : in std_logic_vector(3 downto 0);
	en : in std_logic;
	q : out std_logic_vector(15 downto 0));
end component;
component decriptor
PORT
	(a : in std_logic_vector(1 downto 0);
	en : in std_logic;
	q : out std_logic_vector(3 downto 0)); 
end component;
BEGIN
	s0: decriptor port map(a(5 downto 4), en, b(3 downto 0));
	s1: superdecr port map(a(3 downto 0), b(0), q(15 downto 0));
	s2: superdecr port map(a(3 downto 0), b(1), q(31 downto 16));
	s3: superdecr port map(a(3 downto 0), b(2), q(47 downto 32));
	s4: superdecr port map(a(3 downto 0), b(3), q(63 downto 48));
END squad;
configuration con of megadecr is
	for squad
		for s1, s2, s3, s4: superdecr
			use entity work.superdecr(squad); 
		end for;
		for s0: decriptor
			use entity work.decriptor(behav); 
		end for;
	end for;
end con;
