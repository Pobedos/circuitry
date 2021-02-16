LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

ENTITY Cashe IS
	PORT
	(tag :IN STD_LOGIC_VECTOR(7 downto 0);
	 data :IN STD_LOGIC_VECTOR(7 downto 0);
	 awr :IN STD_LOGIC_VECTOR(2 downto 0);
	 wr :IN STD_LOGIC;
	 read :IN STD_LOGIC;
	 res :INOUT STD_LOGIC_VECTOR(7 downto 0);
	 hit :INOUT STD_LOGIC
);
END Cashe;

ARCHITECTURE behav OF Cashe IS
type byte is array (7 downto 0) of std_logic_vector(7 downto 0);
SIGNAL Dout: byte;
SIGNAL tagD: byte;
SIGNAL writer: std_logic;
BEGIN
process(tag, data, awr, WR, read, hit)
variable count: integer range 7 downto 0;
variable numhit: integer range 7 downto 0;
begin

if(rising_edge(wr)) then
	tagD(conv_integer(unsigned(awr))) <= tag;
	Dout(conv_integer(unsigned(awr))) <= data;
end if;

if(tagD(numhit) = tag) then
	hit <= '1';
else
	hit <= '0';
	for count in 0 to 7 loop
			if(tagD(count) = tag) then
				numhit := count;
			end if;
	end loop;
end if;

if(read = '1') then
	if(hit = '1') then
		res <= dout(numhit);
	else
		res <= "00000000";
	end if;
else
res <= "00000000";
end if;
end process;
END behav;
