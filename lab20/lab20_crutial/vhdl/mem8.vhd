LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mem8 IS
PORT( CLK	:	IN	STD_LOGIC;
	  D0	:	IN	STD_LOGIC;
      D1	:	IN	STD_LOGIC;
      D2	:	IN	STD_LOGIC;
      D3	:	IN	STD_LOGIC;
      D4	:	IN	STD_LOGIC;
      D5	:	IN	STD_LOGIC;
      D6	:	IN	STD_LOGIC;
      D7	:	IN	STD_LOGIC;

	  Q0	:	INOUT	STD_LOGIC;
      Q1	:	INOUT	STD_LOGIC;
      Q2	:	INOUT	STD_LOGIC;
      Q3	:	INOUT	STD_LOGIC;
      Q4	:	INOUT	STD_LOGIC;
      Q5	:	INOUT	STD_LOGIC;
      Q6	:	INOUT	STD_LOGIC;
      Q7	:	INOUT	STD_LOGIC
);
END mem8;

ARCHITECTURE arch OF mem8 IS

COMPONENT aa5dff
PORT
(
	D		:  IN	  STD_LOGIC;
	CLK		:  IN	  STD_LOGIC;
	Q		:  INOUT  STD_LOGIC
);
END COMPONENT;

BEGIN

dff0 : aa5dff
PORT MAP ( D0, CLK, Q0 );
dff1 : aa5dff
PORT MAP ( D1, CLK, Q1 );
dff2 : aa5dff
PORT MAP ( D2, CLK, Q2 );
dff3 : aa5dff
PORT MAP ( D3, CLK, Q3 );
dff4 : aa5dff
PORT MAP ( D4, CLK, Q4 );
dff5 : aa5dff
PORT MAP ( D5, CLK, Q5 );
dff6 : aa5dff
PORT MAP ( D6, CLK, Q6 );
dff7 : aa5dff
PORT MAP ( D7, CLK, Q7 );

END arch;

CONFIGURATION conf OF mem8 IS
	FOR arch

		FOR dff0, dff1, dff2, dff3, dff4, dff5, dff6, dff7 : aa5dff
			USE ENTITY work.aa5dff (arch);
		END FOR;

	END FOR;
END conf;

