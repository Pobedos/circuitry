LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rstrigger IS

	PORT
	(
		S	: IN	STD_LOGIC;
		R   : IN	STD_LOGIC;
		Q	: INOUT	STD_LOGIC;
		QI	: INOUT	STD_LOGIC
	);
	
END rstrigger;

ARCHITECTURE arch OF rstrigger IS

	SIGNAL	QS, QIS	: STD_LOGIC;
	
BEGIN

	PROCESS ( S, R )
	BEGIN
    	IF S='0' THEN
				IF R='0' THEN QS<=QS; QIS <= QIS;
	            ELSE QS<='0'; QIS <= '1';
	        	END IF;
		ELSE QS<='1'; QIS <= '0';
		END IF;
	END PROCESS;

			
	Q <= QS; QI <= QIS;

END arch;


