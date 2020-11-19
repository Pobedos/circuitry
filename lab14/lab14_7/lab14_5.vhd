LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab14_5 IS
	PORT
	(X :IN STD_LOGIC_VECTOR(3 downto 0);
	Y :IN STD_LOGIC_VECTOR(3 downto 0);
	inXMY :IN STD_LOGIC;
	inXEY :IN STD_LOGIC;
	inXLY :IN STD_LOGIC;
	XMY :INOUT STD_LOGIC;
	XEY :INOUT STD_LOGIC;
	XLY :INOUT STD_LOGIC);
END lab14_5;
ARCHITECTURE behav OF lab14_5 IS
component lab14_4
PORT
	(X :IN STD_LOGIC_VECTOR(1 downto 0);
	Y :IN STD_LOGIC_VECTOR(1 downto 0);
	inXMY :IN STD_LOGIC;
	inXEY :IN STD_LOGIC;
	inXLY :IN STD_LOGIC;
	XMY :INOUT STD_LOGIC;
	XEY :INOUT STD_LOGIC;
	XLY :INOUT STD_LOGIC);
end component;
signal sXMY, sXEY, sXLY : std_logic;
BEGIN
	m1: lab14_4 port map(X(3 downto 2), Y(3 downto 2), sXMY, sXEY, sXLY, XMY, XEY, XLY);
	m2: lab14_4 port map(X(1 downto 0), Y(1 downto 0), inXMY, inXEY, inXLY, sXMY, sXEY, sXLY);
END behav;
