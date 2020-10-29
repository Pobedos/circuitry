LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY decriptor IS
	PORT
	(a : in std_logic_vector(1 downto 0);
	en : in std_logic;
	q : out std_logic_vector(3 downto 0)
);
END decriptor;
ARCHITECTURE behav OF decriptor IS
BEGIN
process(a, en)begin
	if(en = '0') then
		q <= "0000";
	else
		case a is
			when "00" => q <="0001";
			when "01" => q <="0010";
			when "10" => q <="0100";
			when "11" => q <="1000";
			when others => q <="0000";
		end case;
	end if;
end process;
END behav;

