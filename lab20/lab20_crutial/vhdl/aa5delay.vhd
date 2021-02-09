LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY aa5delay IS

PORT
(
	A		: IN	STD_LOGIC;
	Q		: INOUT	STD_LOGIC
);
	
END aa5delay;

ARCHITECTURE arch OF aa5delay IS

	SIGNAL	QS	: STD_LOGIC;
	
BEGIN

	PROCESS ( A )
	BEGIN
	
		QS <= NOT (NOT A);
		
	END PROCESS;
			
	Q <= QS;
	
END arch;
