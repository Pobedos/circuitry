LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter IS

	PORT
	(
		CLK		:  IN	  STD_LOGIC;
		RESET	:  IN	  STD_LOGIC;
		Q1		:  INOUT  STD_LOGIC;
		Q2		:  INOUT  STD_LOGIC;
		Q3		:  INOUT  STD_LOGIC
	);
	
END counter;

ARCHITECTURE arch OF counter IS

	SIGNAL	Q1S, Q2S, Q3S : STD_LOGIC;
	
BEGIN

	PROCESS (CLK, RESET, Q1, Q2, Q3)
	BEGIN
      IF RESET='1' THEN
       	Q1S<='0'; 
       	Q2S<='0'; 
       	Q3S<='0'; 
      ELSE
		IF (CLK'EVENT AND CLK='1') THEN
       		Q1S <= NOT(Q1);
			Q2S <= Q1 XOR Q2;
        	Q3S<= (Q1 AND Q2) XOR Q3;
		END IF;
      END IF;
    END PROCESS;
			
	Q1<=Q1S; Q2<=Q2S; Q3<=Q3S;
	
END arch;
