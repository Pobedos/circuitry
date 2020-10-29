LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dtr IS
PORT(d:  IN    std_logic;
	 l:  IN    std_logic;
	 q:  INOUT std_logic;
	 qb: INOUT std_logic);
END dtr;

ARCHITECTURE behav OF dtr IS

COMPONENT notand
PORT(a: IN std_logic;
	b: IN std_logic;
	c: INOUT std_logic);
END COMPONENT;

COMPONENT rstr
PORT(s: IN std_logic;
	r: IN std_logic;
	q: INOUT std_logic;
	qb: INOUT std_logic);
END COMPONENT;

SIGNAL sig_1 : std_logic;
SIGNAL sig_2 : std_logic;

BEGIN
u1: notand
	PORT MAP(d, l, sig_1);
u2: notand
	PORT MAP(sig_1, l, sig_2);
r_s: rstr
	PORT MAP(sig_1, sig_2, q, qb);
END behav;

CONFIGURATION con OF dtr IS
FOR behav
FOR u1, u2: notand
	USE ENTITY work.notand (behavior);
END FOR;
FOR r_s: rstr
	USE ENTITY work.rstr (behavior);
END FOR;
END FOR;
END con;
