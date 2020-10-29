LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rstr1 IS

	PORT
	(
		s	: IN	 STD_LOGIC;
		r	: IN	 STD_LOGIC;
		q	:INOUT    STD_LOGIC;
		qb	: INOUT	 STD_LOGIC
	);
	
END rstr1;

ARCHITECTURE behav OF rstr1 IS

	SIGNAL	qs:STD_LOGIC;
	
BEGIN

	PROCESS (s, r)
	BEGIN
	
		IF s = '1' THEN
		
			IF r = '1' THEN qs<=qs;
			ELSE qs<='0';
			END IF;
		ELSE qs<='1';			
		END IF;	
	END PROCESS;	
q<=qs;
qb<= NOT qs;
END behav;

