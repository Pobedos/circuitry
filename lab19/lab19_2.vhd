LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab19_2 IS
	PORT
	(Data :IN STD_LOGIC_VECTOR(7 downto 0);
	 KKS :IN STD_LOGIC_VECTOR(7 downto 0);
	 Query :IN STD_LOGIC;
	 CLK :IN STD_LOGIC;
	 Get :INOUT STD_LOGIC;
	 Synchro :INOUT STD_LOGIC;
	 Q :INOUT STD_LOGIC_VECTOR(7 downto 0)
);
END lab19_2;

ARCHITECTURE behav OF lab19_2 IS
signal s0, s1, s2, s3, s4, s5, s6, s7: std_logic_vector(7 downto 0);
BEGIN
process(KKS, Query, CLK)
variable count: integer range 0 to 8;
begin

if(KKS = s7) then
	Synchro <= '1';
else
	Synchro <= '0';
end if;

if(rising_edge(CLK)) then
		if(not(count = 0) and not(count = 7)) then
			count := count + 1;
			Get <= '1';
			s0 <= Data;
			s1 <= s0;
			s2 <= s1;
			s3 <= s2;
			s4 <= s3;
			s5 <= s4;
			s6 <= s5;
			s7 <= s6;
		elsif(count = 7) then
			count := 0;
			Get <= '1';
			s0 <= Data;
			s1 <= s0;
			s2 <= s1;
			s3 <= s2;
			s4 <= s3;
			s5 <= s4;
			s6 <= s5;
			s7 <= s6;
		else
			if(KKS = s7 and Query = '1') then
				s0 <= Data;
				count := 1;
				Get <= '1';
			else
				s0 <= s7;
				count := count;
				Get <= '0';
			end if;
			s1 <= s0;
			s2 <= s1;
			s3 <= s2;
			s4 <= s3;
			s5 <= s4;
			s6 <= s5;
			s7 <= s6;
		end if;
	end if;

end process;
Q <= s7;
END behav;
