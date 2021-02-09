LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY aa5dff IS

	PORT
	(
		D		:  IN	  STD_LOGIC;
		CLK		:  IN	  STD_LOGIC;
		Q		:  INOUT  STD_LOGIC
	);
	
END aa5dff;

ARCHITECTURE arch OF aa5dff IS

	SIGNAL	QS : STD_LOGIC;
	
BEGIN

	PROCESS (D, CLK, Q)
	BEGIN
		IF (CLK'EVENT AND CLK='1') THEN
			QS <= D;
		ELSE
			QS <= Q;
		END IF;
    END PROCESS;
			
	Q <= QS;
	
END arch;

