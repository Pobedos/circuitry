library ieee;
use ieee.std_logic_1164.all;
use work.row_type.row;

package matrix_type is
    type matrix is array (0 to 3) of row;
end package;
