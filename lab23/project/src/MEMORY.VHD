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
			(X"1000_0000",
			 X"1001_0107",
			 X"1002_0209",
			 X"1003_0318",
			 X"1004_040C",
			 X"1005_051A",
			 X"1006_060F",
			 X"1007_0714",
			 X"1008_0815",
			 X"1009_0907",
			 X"100A_0A16",
			 X"100B_0B08",
			 X"100C_0C0F",
			 X"100D_0D03",
			 X"100E_0E18",
			 X"100F_0F1E",
			 X"1010_100D",
			 X"0011_1101",
			 X"0012_1205",
			 X"0013_1309",
			 X"0014_140D",
			 X"1015_1500",
			 X"1016_1600",
			 X"1017_1700",
			 X"1015_1501",
			 X"1017_1701",
			 X"111A_1704",
			 X"500A_0004",
			 X"1017_0000",
			 X"1016_1601",
			 X"111E_1604",
			 X"5009_0006",
			 X"3020_1500",
			 X"3021_1611",
			 X"0122_2021",
			 X"500A_00F4",
			 X"3120_1611",
			 X"5000_00F2",
			 X"0026_2611",
			 X"0026_2612",
			 X"0026_2613",
			 X"0026_2614",
			 others =>X"0000_0000");		
	begin
		--
		-- put d_bus and reply into initial state
		--
		d_bus <=null after (2*Tpd);
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
				d_bus <= mem(address) after (2*Tpd);	-- fetch data
				ready <='1' after Tpd;
				wait until read='0'; -- hold for read cycle
			end if;
		end if;
	end process;		
end behaviour;						

