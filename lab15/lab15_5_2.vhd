LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab15_5_2 IS
	PORT
	(X :IN  STD_LOGIC_VECTOR(7 downto 0);
	 d: IN STD_LOGIC;
	 o: OUT STD_LOGIC_VECTOR(7 downto 0);
	 even: INOUT STD_LOGIC;
	 odd:  INOUT STD_LOGIC);
END lab15_5_2;
ARCHITECTURE behav OF lab15_5_2 IS
component lab15_5
PORT
	(X    :IN STD_LOGIC_VECTOR(7 downto 0);
	 d    :IN STD_LOGIC;
	 even :INOUT STD_LOGIC;
	 odd  :INOUT STD_LOGIC);
end component;
signal e, g : std_logic;
BEGIN
	c1: lab15_5 port map(X(7 downto 0), d, e, g);
	c2: lab15_5 port map(X(7 downto 0), e, even, odd);
	o <= X;
END behav;
configuration con of lab15_5_2 is
	for behav
		for c1, c2: lab15_5
			use entity work.lab15_5(behav);
		end for;
	end for;
end;
