LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lbuffer IS

	PORT
	(
		DATA0 : IN STD_LOGIC;
		DATA1 : IN STD_LOGIC;
		DATA2 : IN STD_LOGIC;
		DATA3 : IN STD_LOGIC;
		DATA4 : IN STD_LOGIC;
		DATA5 : IN STD_LOGIC;
		DATA6 : IN STD_LOGIC;
		DATA7 : IN STD_LOGIC;

		RD : IN STD_LOGIC;
		WR : IN STD_LOGIC;

		Q0 : INOUT STD_LOGIC;
		Q1 : INOUT STD_LOGIC;
		Q2 : INOUT STD_LOGIC;
		Q3 : INOUT STD_LOGIC;
		Q4 : INOUT STD_LOGIC;
		Q5 : INOUT STD_LOGIC;
		Q6 : INOUT STD_LOGIC;
		Q7 : INOUT STD_LOGIC;

		TMP_DFFQ00 : INOUT STD_LOGIC;
		TMP_DFFQ01 : INOUT STD_LOGIC;
		TMP_DFFQ02 : INOUT STD_LOGIC;
		TMP_DFFQ03 : INOUT STD_LOGIC;
		TMP_DFFQ04 : INOUT STD_LOGIC;
		TMP_DFFQ05 : INOUT STD_LOGIC;
		TMP_DFFQ06 : INOUT STD_LOGIC;
		TMP_DFFQ07 : INOUT STD_LOGIC;
	
		TMP_DFFQ10 : INOUT STD_LOGIC;
		TMP_DFFQ11 : INOUT STD_LOGIC;
		TMP_DFFQ12 : INOUT STD_LOGIC;
		TMP_DFFQ13 : INOUT STD_LOGIC;
		TMP_DFFQ14 : INOUT STD_LOGIC;
		TMP_DFFQ15 : INOUT STD_LOGIC;
		TMP_DFFQ16 : INOUT STD_LOGIC;
		TMP_DFFQ17 : INOUT STD_LOGIC;

		TMP_DFFQ20 : INOUT STD_LOGIC;
		TMP_DFFQ21 : INOUT STD_LOGIC;
		TMP_DFFQ22 : INOUT STD_LOGIC;
		TMP_DFFQ23 : INOUT STD_LOGIC;
		TMP_DFFQ24 : INOUT STD_LOGIC;
		TMP_DFFQ25 : INOUT STD_LOGIC;
		TMP_DFFQ26 : INOUT STD_LOGIC;
		TMP_DFFQ27 : INOUT STD_LOGIC;
	
		TMP_DFFQ30 : INOUT STD_LOGIC;
		TMP_DFFQ31 : INOUT STD_LOGIC;
		TMP_DFFQ32 : INOUT STD_LOGIC;
		TMP_DFFQ33 : INOUT STD_LOGIC;
		TMP_DFFQ34 : INOUT STD_LOGIC;
		TMP_DFFQ35 : INOUT STD_LOGIC;
		TMP_DFFQ36 : INOUT STD_LOGIC;
		TMP_DFFQ37 : INOUT STD_LOGIC;

		TMP_DFFQ40 : INOUT STD_LOGIC;
		TMP_DFFQ41 : INOUT STD_LOGIC;
		TMP_DFFQ42 : INOUT STD_LOGIC;
		TMP_DFFQ43 : INOUT STD_LOGIC;
		TMP_DFFQ44 : INOUT STD_LOGIC;
		TMP_DFFQ45 : INOUT STD_LOGIC;
		TMP_DFFQ46 : INOUT STD_LOGIC;
		TMP_DFFQ47 : INOUT STD_LOGIC;
	
		TMP_DFFQ50 : INOUT STD_LOGIC;
		TMP_DFFQ51 : INOUT STD_LOGIC;
		TMP_DFFQ52 : INOUT STD_LOGIC;
		TMP_DFFQ53 : INOUT STD_LOGIC;
		TMP_DFFQ54 : INOUT STD_LOGIC;
		TMP_DFFQ55 : INOUT STD_LOGIC;
		TMP_DFFQ56 : INOUT STD_LOGIC;
		TMP_DFFQ57 : INOUT STD_LOGIC;

		TMP_DFFQ60 : INOUT STD_LOGIC;
		TMP_DFFQ61 : INOUT STD_LOGIC;
		TMP_DFFQ62 : INOUT STD_LOGIC;
		TMP_DFFQ63 : INOUT STD_LOGIC;
		TMP_DFFQ64 : INOUT STD_LOGIC;
		TMP_DFFQ65 : INOUT STD_LOGIC;
		TMP_DFFQ66 : INOUT STD_LOGIC;
		TMP_DFFQ67 : INOUT STD_LOGIC;
	
		TMP_DFFQ70 : INOUT STD_LOGIC;
		TMP_DFFQ71 : INOUT STD_LOGIC;
		TMP_DFFQ72 : INOUT STD_LOGIC;
		TMP_DFFQ73 : INOUT STD_LOGIC;
		TMP_DFFQ74 : INOUT STD_LOGIC;
		TMP_DFFQ75 : INOUT STD_LOGIC;
		TMP_DFFQ76 : INOUT STD_LOGIC;
		TMP_DFFQ77 : INOUT STD_LOGIC

);
	
END lbuffer;

ARCHITECTURE arch OF lbuffer IS

COMPONENT dff8ds
PORT( CLKF	:	IN	STD_LOGIC;
	  CLKB	:	IN	STD_LOGIC;

	  DF0	:	IN	STD_LOGIC;
      DF1	:	IN	STD_LOGIC;
      DF2	:	IN	STD_LOGIC;
      DF3	:	IN	STD_LOGIC;
      DF4	:	IN	STD_LOGIC;
      DF5	:	IN	STD_LOGIC;
      DF6	:	IN	STD_LOGIC;
      DF7	:	IN	STD_LOGIC;

	  DB0	:	IN	STD_LOGIC;
      DB1	:	IN	STD_LOGIC;
      DB2	:	IN	STD_LOGIC;
      DB3	:	IN	STD_LOGIC;
      DB4	:	IN	STD_LOGIC;
      DB5	:	IN	STD_LOGIC;
      DB6	:	IN	STD_LOGIC;
      DB7	:	IN	STD_LOGIC;

	  Q0	:	INOUT	STD_LOGIC;
      Q1	:	INOUT	STD_LOGIC;
      Q2	:	INOUT	STD_LOGIC;
      Q3	:	INOUT	STD_LOGIC;
      Q4	:	INOUT	STD_LOGIC;
      Q5	:	INOUT	STD_LOGIC;
      Q6	:	INOUT	STD_LOGIC;
      Q7	:	INOUT	STD_LOGIC
);
END COMPONENT;


COMPONENT mem8
PORT( 
	  CLK	:	IN	STD_LOGIC;
	  D0	:	IN	STD_LOGIC;
      D1	:	IN	STD_LOGIC;
      D2	:	IN	STD_LOGIC;
      D3	:	IN	STD_LOGIC;
      D4	:	IN	STD_LOGIC;
      D5	:	IN	STD_LOGIC;
      D6	:	IN	STD_LOGIC;
      D7	:	IN	STD_LOGIC;

	  Q0	:	INOUT	STD_LOGIC;
      Q1	:	INOUT	STD_LOGIC;
      Q2	:	INOUT	STD_LOGIC;
      Q3	:	INOUT	STD_LOGIC;
      Q4	:	INOUT	STD_LOGIC;
      Q5	:	INOUT	STD_LOGIC;
      Q6	:	INOUT	STD_LOGIC;
      Q7	:	INOUT	STD_LOGIC
);
END COMPONENT;

BEGIN

dff8ds_0 : dff8ds
PORT MAP( WR, RD, DATA0,      DATA1,      DATA2,      DATA3,      DATA4,      DATA5,      DATA6,      DATA7,
                  TMP_DFFQ10, TMP_DFFQ11, TMP_DFFQ12, TMP_DFFQ13, TMP_DFFQ14, TMP_DFFQ15, TMP_DFFQ16, TMP_DFFQ17,
		          TMP_DFFQ00, TMP_DFFQ01, TMP_DFFQ02, TMP_DFFQ03, TMP_DFFQ04, TMP_DFFQ05, TMP_DFFQ06, TMP_DFFQ07 );
dff8ds_1 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ00, TMP_DFFQ01, TMP_DFFQ02, TMP_DFFQ03, TMP_DFFQ04, TMP_DFFQ05, TMP_DFFQ06, TMP_DFFQ07,
                  TMP_DFFQ20, TMP_DFFQ21, TMP_DFFQ22, TMP_DFFQ23, TMP_DFFQ24, TMP_DFFQ25, TMP_DFFQ26, TMP_DFFQ27,
		          TMP_DFFQ10, TMP_DFFQ11, TMP_DFFQ12, TMP_DFFQ13, TMP_DFFQ14, TMP_DFFQ15, TMP_DFFQ16, TMP_DFFQ17 );
dff8ds_2 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ10, TMP_DFFQ11, TMP_DFFQ12, TMP_DFFQ13, TMP_DFFQ14, TMP_DFFQ15, TMP_DFFQ16, TMP_DFFQ17,
                  TMP_DFFQ30, TMP_DFFQ31, TMP_DFFQ32, TMP_DFFQ33, TMP_DFFQ34, TMP_DFFQ35, TMP_DFFQ36, TMP_DFFQ37,
		          TMP_DFFQ20, TMP_DFFQ21, TMP_DFFQ22, TMP_DFFQ23, TMP_DFFQ24, TMP_DFFQ25, TMP_DFFQ26, TMP_DFFQ27 );
dff8ds_3 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ20, TMP_DFFQ21, TMP_DFFQ22, TMP_DFFQ23, TMP_DFFQ24, TMP_DFFQ25, TMP_DFFQ26, TMP_DFFQ27,
                  TMP_DFFQ40, TMP_DFFQ41, TMP_DFFQ42, TMP_DFFQ43, TMP_DFFQ44, TMP_DFFQ45, TMP_DFFQ46, TMP_DFFQ47,
		          TMP_DFFQ30, TMP_DFFQ31, TMP_DFFQ32, TMP_DFFQ33, TMP_DFFQ34, TMP_DFFQ35, TMP_DFFQ36, TMP_DFFQ37 );
dff8ds_4 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ30, TMP_DFFQ31, TMP_DFFQ32, TMP_DFFQ33, TMP_DFFQ34, TMP_DFFQ35, TMP_DFFQ36, TMP_DFFQ37,
                  TMP_DFFQ50, TMP_DFFQ51, TMP_DFFQ52, TMP_DFFQ53, TMP_DFFQ54, TMP_DFFQ55, TMP_DFFQ56, TMP_DFFQ57,
		          TMP_DFFQ40, TMP_DFFQ41, TMP_DFFQ42, TMP_DFFQ43, TMP_DFFQ44, TMP_DFFQ45, TMP_DFFQ46, TMP_DFFQ47 );
dff8ds_5 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ40, TMP_DFFQ41, TMP_DFFQ42, TMP_DFFQ43, TMP_DFFQ44, TMP_DFFQ45, TMP_DFFQ46, TMP_DFFQ47,
                  TMP_DFFQ60, TMP_DFFQ61, TMP_DFFQ62, TMP_DFFQ63, TMP_DFFQ64, TMP_DFFQ65, TMP_DFFQ66, TMP_DFFQ67,
		          TMP_DFFQ50, TMP_DFFQ51, TMP_DFFQ52, TMP_DFFQ53, TMP_DFFQ54, TMP_DFFQ55, TMP_DFFQ56, TMP_DFFQ57 );
dff8ds_6 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ50, TMP_DFFQ51, TMP_DFFQ52, TMP_DFFQ53, TMP_DFFQ54, TMP_DFFQ55, TMP_DFFQ56, TMP_DFFQ57,
                  TMP_DFFQ70, TMP_DFFQ71, TMP_DFFQ72, TMP_DFFQ73, TMP_DFFQ74, TMP_DFFQ75, TMP_DFFQ76, TMP_DFFQ77,
		          TMP_DFFQ60, TMP_DFFQ61, TMP_DFFQ62, TMP_DFFQ63, TMP_DFFQ64, TMP_DFFQ65, TMP_DFFQ66, TMP_DFFQ67 );
dff8ds_7 : dff8ds
PORT MAP( WR, RD, TMP_DFFQ60, TMP_DFFQ61, TMP_DFFQ62, TMP_DFFQ63, TMP_DFFQ64, TMP_DFFQ65, TMP_DFFQ66, TMP_DFFQ67,
                  TMP_DFFQ70, TMP_DFFQ71, TMP_DFFQ72, TMP_DFFQ73, TMP_DFFQ74, TMP_DFFQ75, TMP_DFFQ76, TMP_DFFQ77,
		          TMP_DFFQ70, TMP_DFFQ71, TMP_DFFQ72, TMP_DFFQ73, TMP_DFFQ74, TMP_DFFQ75, TMP_DFFQ76, TMP_DFFQ77 );

mem8_out : mem8
PORT MAP( RD, TMP_DFFQ00, TMP_DFFQ01, TMP_DFFQ02, TMP_DFFQ03, TMP_DFFQ04, TMP_DFFQ05, TMP_DFFQ06, TMP_DFFQ07,
		      Q0,         Q1,         Q2,         Q3,         Q4,         Q5,         Q6,         Q7          );

END arch;

CONFIGURATION conf OF lbuffer IS
	FOR arch

		FOR mem8_out : mem8
			USE ENTITY work.mem8(arch);
		END FOR;
		
		FOR dff8ds_0, dff8ds_1, dff8ds_2, dff8ds_3, dff8ds_4, dff8ds_5, dff8ds_6, dff8ds_7 : dff8ds
			USE ENTITY work.dff8ds(arch);
		END FOR;

	END FOR;
END conf;
