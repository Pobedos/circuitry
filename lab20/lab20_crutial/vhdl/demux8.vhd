LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY demux8 IS

	PORT
	(
		E : IN STD_LOGIC;
		ADR0 : IN STD_LOGIC;
		ADR1 : IN STD_LOGIC;
		ADR2 : IN STD_LOGIC;

		F0 : INOUT STD_LOGIC;
		F1 : INOUT STD_LOGIC;
		F2 : INOUT STD_LOGIC;
		F3 : INOUT STD_LOGIC;
		F4 : INOUT STD_LOGIC;
		F5 : INOUT STD_LOGIC;
		F6 : INOUT STD_LOGIC;
		F7 : INOUT STD_LOGIC
	);
	
END demux8;

ARCHITECTURE arch OF demux8 IS

	SIGNAL	F0S, F1S, F2S, F3S, F4S, F5S, F6S, F7S	: STD_LOGIC;
	
BEGIN

	PROCESS ( E, ADR0, ADR1, ADR2 )
	BEGIN
		IF ( ADR0 = '0' AND ADR1 = '0' AND ADR2 = '0' ) THEN
			F0S <= E; F1S <= '0'; F2S <= '0'; F3S <= '0'; F4S <= '0'; F5S <= '0'; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '1' AND ADR1 = '0' AND ADR2 = '0' ) THEN
			F0S <= '0'; F1S <= E; F2S <= '0'; F3S <= '0'; F4S <= '0'; F5S <= '0'; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '0' AND ADR1 = '1' AND ADR2 = '0' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= E; F3S <= '0'; F4S <= '0'; F5S <= '0'; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '1' AND ADR1 = '1' AND ADR2 = '0' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= '0'; F3S <= E; F4S <= '0'; F5S <= '0'; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '0' AND ADR1 = '0' AND ADR2 = '1' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= '0'; F3S <= '0'; F4S <= E; F5S <= '0'; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '1' AND ADR1 = '0' AND ADR2 = '1' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= '0'; F3S <= '0'; F4S <= '0'; F5S <= E; F6S <= '0'; F7S <= '0';
		ELSIF ( ADR0 = '0' AND ADR1 = '1' AND ADR2 = '1' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= '0'; F3S <= '0'; F4S <= '0'; F5S <= '0'; F6S <= E; F7S <= '0';
		ELSIF ( ADR0 = '1' AND ADR1 = '1' AND ADR2 = '1' ) THEN
			F0S <= '0'; F1S <= '0'; F2S <= '0'; F3S <= '0'; F4S <= '0'; F5S <= '0'; F6S <= '0'; F7S <= E;
		END IF;
	END PROCESS;

	F0 <= F0S; F1 <= F1S; F2 <= F2S; F3 <= F3S;
	F4 <= F4S; F5 <= F5S; F6 <= F6S; F7 <= F7S;

END arch;
