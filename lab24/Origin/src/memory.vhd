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
			(X"5000_0014",
			X"0000_0007",
			X"0000_0009",
			X"0000_0018",
			X"0000_000C",
			X"0000_001A",
			X"0000_000F",
			X"0000_0014",
			X"0000_0015",
			X"0000_0007",
			X"0000_0016",
			X"0000_0008",
			X"0000_000F",
			X"0000_0003",
			X"0000_0018",
			X"0000_001E",
			X"0000_000D",
			X"0000_0000",
			X"0000_0000",
			X"0000_0000",
			X"0000_0000",
			X"1015_1500",
			X"1016_1600",
			X"1017_1700",
			X"1015_1501",
			X"1017_1701",
			X"111A_1705",
			X"500A_0004",
			X"1017_0001",
			X"1016_1601",
			X"111E_1604",
			X"5009_0006",
			X"3020_1500",
			X"3021_1611",
			X"0122_2021",
			X"500A_00F4",
			X"3120_1611",
			X"5000_00F2",
			X"1017_0000",
			X"3027_1711",
			X"0028_2827",
			X"1017_1701",
			X"112A_1704",
			X"500A_00FB",
			X"102C_2800",
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

