LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
ENTITY lab14_4 IS
	PORT
	(X :IN STD_LOGIC_VECTOR(1 downto 0);
	Y :IN STD_LOGIC_VECTOR(1 downto 0);
	inXMY :IN STD_LOGIC;
	inXEY :IN STD_LOGIC;
	inXLY :IN STD_LOGIC;
	XMY :INOUT STD_LOGIC;
	XEY :INOUT STD_LOGIC;
	XLY :INOUT STD_LOGIC);
END lab14_4;

ARCHITECTURE behav OF lab14_4 IS
BEGIN
process(X,Y)begin
	if(conv_integer(unsigned(X))>conv_integer(unsigned(Y))) then
		XMY <= '1';
		XEY <= '0';
		XLY <= '0';
	elsif(conv_integer(unsigned(X))<conv_integer(unsigned(Y))) then
		XMY <= '0';
		XEY <= '0';
		XLY <= '1';
	elsif(conv_integer(unsigned(X))=conv_integer(unsigned(Y))) then
		if(inXMY='1') then
			XMY <= '1';
			XEY <= '0';
			XLY <= '0';
		elsif(inXLY='1') then
			XMY <= '0';
			XEY <= '0';
			XLY <= '1';
		elsif(inXEY='1') then
			XMY <= '0';
			XEY <= '1';
			XLY <= '0';
		else
			XMY <= '0';
			XEY <= '0';
			XLY <= '0';
		end if;
	end if;
end process;
END behav;
