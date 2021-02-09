LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY aa5or2 IS

PORT
(
	A		: IN	STD_LOGIC;
	B		: IN	STD_LOGIC;
	Q		: INOUT	STD_LOGIC
);
	
END aa5or2;

ARCHITECTURE arch OF aa5or2 IS

	SIGNAL	QS	: STD_LOGIC;
	
BEGIN

	PROCESS (A, B)
	BEGIN
	
		QS <= A OR B;
		
	END PROCESS;
			
	Q <= QS;
	
END arch;
