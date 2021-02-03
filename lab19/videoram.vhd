LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY videoram IS
	PORT( DATA: IN std_logic_vector(7 downto 0);
		KKS: IN std_logic_vector(7 downto 0);
		CLK: IN std_logic;
		Query: IN std_logic;
		Q: OUT std_logic_vector(7 downto 0);
		Get: OUT std_logic;
		Synchro: OUT std_logic
		);
END videoram;

ARCHITECTURE behaviour OF videoram IS
type MEM is array (7 downto 0) of std_logic_vector(7 downto 0);
SIGNAL memory: MEM;
SIGNAL getf, sf: std_logic;

BEGIN
	PROCESS(CLK)
		variable count: integer;
	BEGIN
		IF CLK = '1' THEN
			count := count + 1; 
			IF count = 8 THEN
				getf <= '0';
				count := 0;
			END IF;
		IF ( KKS = memory(7)) THEN
			count := 0;
			Synchro <= '1';
		ELSE
			Synchro <= '0';
		END IF;

		IF (( Query = '1' ) AND ( KKS = memory(7) )) OR (getf = '1') THEN

			IF( getf = '0') THEN getf <= '1'; END IF;

				memory(7) <= memory(6);
				memory(6) <= memory(5);
				memory(5) <= memory(4);
				memory(4) <= memory(3);
				memory(3) <= memory(2);
				memory(2) <= memory(1);
				memory(1) <= memory(0);
				memory(0) <= DATA;
			ELSE
				--getf <= '0';
				memory(7) <= memory(6);
				memory(6) <= memory(5);
				memory(5) <= memory(4);
				memory(4) <= memory(3);
				memory(3) <= memory(2);
				memory(2) <= memory(1);
				memory(1) <= memory(0);
				memory(0) <= memory(7);
			END IF;

		END IF;
	END PROCESS;
	Q <= memory(7);
	Get <= getf;
END behaviour;
