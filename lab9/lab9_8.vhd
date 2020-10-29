library ieee;
use ieee.std_logic_1164.all;

entity lab9_8 is
   port( d, c1, c2, r : IN std_logic;
           q1, q2 : out std_logic );
end lab9_8;

architecture arch of lab9_8 is 
signal rData : std_logic_vector(1 downto 0);
signal savedData : std_logic;
begin
  process(d,c1,r)
   begin 
   if ( r = '0') then 
            savedData <= '0' ;
    elsif ( rising_edge(c1) ) then 
        savedData <= d;
   end if;
  
   if (r = '0') then 
     rData <= "00";
     elsif (rising_edge(c2)) then 
 rData <= savedData & rData(1);
   end if;
end process;
  q1 <= rData(1);
  q2 <= rData(0);
end arch;
