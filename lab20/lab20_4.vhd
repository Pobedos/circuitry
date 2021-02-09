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
type byte is array (8 downto 0) of std_logic_vector(7 downto 0);
SIGNAL buff: byte;
BEGIN
process(DI, WR, RD)
variable count: integer range 8 to 0;
variable inc: integer range 8 to 0;
variable dec: integer range 8 to 0;
begin

count := inc - dec;

if(count = 0) then
	FULL <= '0';
	EMPTY <= '1';
elsif(count = 8) then
	FULL <= '1';
	EMPTY <= '0';
else
	FULL <= '0';
	EMPTY <= '0';
end if;

if(Reset = '1') then
	inc := 0;
elsif(rising_edge(WR)) then
	if(count = 8) then
		buff <= buff;
	else
		buff(count) <= DI;
		inc := inc + 1;
	end if;
end if;

if(Reset = '1') then
	dec := 0;
elsif(rising_edge(RD)) then
	if(count = 0) then
		DO <= buff(0);
	elsif(count = 8) then
		DO <= buff(7);
		dec := dec + 1;
	elsif(count = 7) then
		DO <= buff(6);
		dec := dec + 1;
	elsif(count = 6) then
		DO <= buff(5);
		dec := dec + 1;
	elsif(count = 5) then
		DO <= buff(4);
		dec := dec + 1;
	elsif(count = 4) then
		DO <= buff(3);
		dec := dec + 1;
	elsif(count = 3) then
		DO <= buff(2);
		dec := dec + 1;
	elsif(count = 2) then
		DO <= buff(1);
		dec := dec + 1;
	elsif(count = 1) then
		DO <= buff(0);
		dec := dec + 1;
	end if;
end if;
end process;
END behav;

