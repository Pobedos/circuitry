LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dtr1 IS

	PORT
	(
		d	: IN	 STD_LOGIC;
		l	: IN	 STD_LOGIC;
		q	: INOUT  STD_LOGIC;
		qb	: INOUT	 STD_LOGIC
	);
	
END dtr1;

ARCHITECTURE behav OF dtr1 IS

	SIGNAL	qs:STD_LOGIC;
	
BEGIN

	PROCESS (d, l)
	BEGIN
	
		IF l = '1' THEN
		
			IF d = '1' THEN qs<='1';
			ELSE qs<='0';
			END IF;
		ELSE qs<=qs;			
		END IF;	
	END PROCESS;	
q<=qs;
qb<= NOT qs;
END behav;
