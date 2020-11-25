LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab15_5_2 IS
	PORT
	(X :IN  STD_LOGIC_VECTOR(7 downto 0);
	 er :IN  STD_LOGIC_VECTOR(8 downto 0);
	 even: INOUT STD_LOGIC;
	 odd:  INOUT STD_LOGIC);
END lab15_5_2;
ARCHITECTURE behav OF lab15_5_2 IS
component lab15_5
PORT
	(X    :IN STD_LOGIC_VECTOR(7 downto 0);
	 d    :IN STD_LOGIC;
	 even :OUT STD_LOGIC;
	 odd  :OUT STD_LOGIC);
end component;
component lab15_5_3
	PORT
	(
		x :  in std_logic_vector(7 downto 0);
		d :  in std_logic;
		er: in std_logic_vector(8 downto 0);
		output: out std_logic_vector(8 downto 0)
	);
end component;
signal ev, od, gnd : std_logic;
signal shift_x : std_logic_vector(8 downto 0);
BEGIN
	gnd <= '0';
	c1: lab15_5 port map(X(7 downto 0), gnd, ev, od);
	d1: lab15_5_3 port map(X(7 downto 0), ev, er(8 downto 0), shift_x(8 downto 0));
	c2: lab15_5 port map(shift_x(7 downto 0), shift_x(8), even, odd);
END behav;