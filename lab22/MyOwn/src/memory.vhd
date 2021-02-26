USE work.dp32_types.all,work.alu_32_types.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity memory is
	generic (Tpd	:Time:= unit_delay);
	port (	d_bus	:inout bus_bit_32 bus;
			a_bus	:in  bit_32;
			read	:in  std_logic;
			write	:in  std_logic;
			ready	:out std_logic);
end  memory;
ARCHITECTURE behaviour OF memory IS
begin
	process
		constant  low_address :integer :=0;
		constant high_address :integer :=65535;
		type memory_array is 
			array(integer range low_address to high_address)of bit_32;
		variable address : integer:=0;
		variable mem :memory_array:=
			( 
			 X"1002_0000", --r2 <= 0; 
			 X"1000_0001", --r0 <= 1;
			 X"1001_0000", --r1 <= 1
			 X"3101_000C", --store '1'(from r1 cell) in 13th cell(r12)
			 X"3101_000D", --store '1'(from r1 cell) in 14th cell(r13)
			 
			 X"310D_000C", --store '1' (from r13 cell) in r12
			 X"3101_000C", -- store value from r1 into r12
			 X"1002_0C00", -- r2 <= r12		
			 X"1000_0D05", -- r0 <= 5 + r13(1)
			 X"0001_0003", -- r1 <= r0 + r2;	
			 X"500C_00FA", -- loop if overflowed	
			 X"5000_00FA", -- loop
			 X"0000_0000", -- 13th cell (storage)
			 X"0000_0000", -- 14th cell (one value)	
			 others =>X"0000_0000");
	begin
		--
		-- put d_bus and reply into initial state
		--
		d_bus <=null after Tpd;
		ready <='0' after Tpd;
		--
		-- wait for a command
		--
		wait until (read='1')or(write='1');
		--
		-- dispatch read or write cycle
		--
		address := bits_to_int(a_bus);
		if address >=low_address and address <=high_address then
			-- address match for this memory
			if write ='1' then
				ready<='1' after Tpd;
				wait until write='0'; -- wait until end of write cycle
				mem(address):=d_bus'delayed(Tpd); -- sample data from Tpd ago
			else  -- read='1'
				d_bus <= mem(address) after Tpd;	-- fetch data
				ready <='1' after Tpd;
				wait until read='0'; -- hold for read cycle
			end if;
		end if;
	end process;		
end behaviour;						

