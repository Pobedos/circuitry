library ieee;
use ieee.std_logic_1164.all;

entity lab9_9 is
  port (
         x1, x2, x3, x4 : in std_logic;
         write, reset, read : in std_logic;
         q1, q2, q3, q4 : out std_logic 
       );
end lab9_9;
architecture behav of lab9_9 is
   signal rData1,rData2,rData3,rData4 : std_logic;
   signal qs1, qs2, qs3, qs4 : std_logic;
begin 
   process(x1, x2, x3, x4, write, read, reset)
begin
  if ( reset = '0') then 
       rData1 <= '0';
        rData2 <= '0';
        rData3 <= '0';
        rData4 <= '0';
       elsif (rising_edge(write)) then
        rData1 <= x1;
        rData2 <= x2;
        rData3 <= x3;
        rData4 <= x4;
        end if;
if (read = '0') then 
  qs1 <= '0';
  qs2 <='0';
  qs3 <= '0';
  qs4 <= '0';
 elsif (rising_edge(read)) then 
  qs1 <= rData1;
  qs2 <=rData2;
  qs3 <= rDAta3;
  qs4 <= rData4;
  end if;
end process;
q1<= qs1;
q2<= qs2;
q3<= qs3;
q4<= qs4;
 
end behav;
