LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab20_4 IS
	PORT
	(DI :IN STD_LOGIC_VECTOR(7 downto 0);
	 Reset :IN STD_LOGIC;
	 WR :IN STD_LOGIC;
	 RD :IN STD_LOGIC;
	 FULL :INOUT STD_LOGIC;
	 EMPTY :INOUT STD_LOGIC;
	 DO :INOUT STD_LOGIC_VECTOR(7 downto 0)
);
END lab20_4;

ARCHITECTURE behav OF lab20_4 IS
type byte is array (7 downto 0) of std_logic_vector(7 downto 0);
SIGNAL buff: byte;
BEGIN
process(DI, WR, RD)
variable count: integer range -7 to 7;
variable increase: integer;
variable decrease: integer;
begin

count := increase - decrease;

if(count = 0) then
	FULL <= '0';
	EMPTY <= '1';
elsif(count = 7) then
	FULL <= '1';
	EMPTY <= '0';
else
	FULL <= '0';
	EMPTY <= '0';
end if;
if(reset = '1') then
	increase := 0;
elsif(rising_edge(WR)) then
	if(count = 7) then
		buff(7) <= DI;
	else
		buff(count) <= DI;
		increase := increase + 1;
	end if;
end if;

if(reset = '1') then
	decrease := 0;
elsif(rising_edge(RD)) then
	if(count = 0) then
		DO <= buff(0);
	else
		DO <= buff(count);
		decrease := decrease + 1;
	end if;
end if;
end process;
END behav;

