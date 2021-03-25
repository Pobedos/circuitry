library ieee;
use ieee.std_logic_1164.all;
use work.matrix_type.all;

entity matrix_max is
	port(
		signal clk:             in std_logic;
		signal reset:           in  std_logic;
        signal in_matrix:       in  matrix;
        signal max_sum:         out integer;
        signal max_value:         out integer;
        signal ready:           out std_logic;
        signal current_col:     out integer
        );
end matrix_max;

architecture behav of matrix_max is
begin
    process (clk, reset, in_matrix)
    	variable max_s:        integer := 0;
    	variable max_v:        integer := 0;
        variable index:        integer := 0;
    begin
   
    
	if (reset = '1') then
		max_s := 0;
		max_v := 0;
		index := 0;
		ready <= '0';
	elsif (index = 4) then 
		max_s := max_s;
		max_v := max_v;
		index := index;
		ready <= '1';
	elsif (clk = '1' and clk'event) then
			ready <= '0';
	    	max_v := 0;
	        for j in 0 to 3 loop
	        	for i in 0 to 3 loop
	        		if (in_matrix(i)(index) > max_v) then
	        			max_v := in_matrix(i)(index);
	        		end if;
	        	end loop;
	        	max_s :=  max_s + max_v;
	        	exit;
	        end loop;
	        index := index + 1;
	else
		ready <= '0';
	end if;
    
    max_sum <= max_s;
    max_value <= max_v;
    current_col <= index;

    end process;
end architecture behav;

