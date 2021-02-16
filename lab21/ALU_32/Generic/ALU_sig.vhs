--*************************************************************
--* This file is automatically generated Test Bench           *
--* template and can be used in Test Bench generator.         *
--* ACTIVE-VHDL Testbench Generator ver. 1.15.           *
--* Copyright (C) ALDEC Inc.                                  *
--*                                                           *
--* This file was generated on:             13:33:53, 16.02.2021    *
--*************************************************************

--Bellow are listed ports used in STIMULUS process,
--Begin Comment
--operand1 : in bit_32
--operand2 : in bit_32
--command : in ALU_command
--1. us : END_SIMULATION_TIME
--End Comment

STIMULUS: process
begin  -- of stimulus process
--wait for <time to next event>; -- <current time>

	operand1 <= "00000000000000000000000000000110";
	operand2 <= "00000000000000000000000000000010";
	command <= disable;
    wait for 100 ns; --0 ps
	command <= pass1;
    wait for 100 ns; --100 ns
	command <= log_and;
    wait for 100 ns; --200 ns
	command <= log_or;
    wait for 100 ns; --300 ns
	command <= log_xor;
    wait for 100 ns; --400 ns
	command <= log_mask;
    wait for 100 ns; --500 ns
	command <= incr1;
    wait for 100 ns; --600 ns
	command <= add;
    wait for 100 ns; --700 ns
	command <= subtract;
    wait for 100 ns; --800 ns
	command <= multiply;
    wait for 100 ns; --900 ns
--	end of stimulus events
	wait;
end process; -- end of stimulus process
	



