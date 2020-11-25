LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab15_5 IS
	PORT
	(X    :IN STD_LOGIC_VECTOR(7 downto 0);
	 d    :IN STD_LOGIC;
	 even :INOUT STD_LOGIC;
	 odd  :INOUT STD_LOGIC);
END lab15_5;

ARCHITECTURE behav OF lab15_5 IS
signal s: std_logic;
BEGIN
process(X,d)
begin
	s <= x(0) xor x(1) xor x(2) xor x(3) xor x(4) xor x(5) xor x(6) xor x(7);
end process;
even <= s xor d;
odd <= not even;
END behav;
