LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab20_2 IS
	PORT
	(DI :IN STD_LOGIC_VECTOR(7 downto 0);
	 Reset :IN STD_LOGIC;
	 WR :IN STD_LOGIC;
	 RD :IN STD_LOGIC;
	 FULL :INOUT STD_LOGIC;
	 EMPTY :INOUT STD_LOGIC;
	 DO :INOUT STD_LOGIC_VECTOR(7 downto 0)
);
END lab20_2;

ARCHITECTURE behav OF lab20_2 IS
type byte is array (7 downto 0) of std_logic_vector(7 downto 0);
SIGNAL buff: byte;
BEGIN
process(DI, WR, RD)
variable countWR: integer range 0 to 7;
variable countRD: integer range 0 to 7;
begin

if(not(countWR = countRD)) then
	FULL <= '0';
	EMPTY <= '0';
else
	if(WR = '0' and RD = '0') then
		FULL <= FULL;
		EMPTY <= EMPTY;
	elsif(WR = '1' and RD = '0') then
		FULL <= '1';
		EMPTY <= '0';
	else
		FULL <= '0';
		EMPTY <= '1';
	end if;
end if;

if(reset = '1') then
	countWR := 0;
elsif(rising_edge(WR)) then
	if(countWR = 7) then
		buff(7) <= DI;
		countWR := 0;
	else
		buff(countWR) <= DI;
		countWR := countWR + 1;
	end if;
end if;

if(reset = '1') then
	countRD := 0;
elsif(rising_edge(RD)) then
	if(countRD = 7) then
		DO <= buff(7);
		countRD := 0;
	else
		DO <= buff(countRD);
		countRD := countRD + 1;
	end if;
end if;
end process;
END behav;
