LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY videomemory IS
PORT( 
	  D0	:	IN	STD_LOGIC;
      D1	:	IN	STD_LOGIC;
      D2	:	IN	STD_LOGIC;
      D3	:	IN	STD_LOGIC;
      D4	:	IN	STD_LOGIC;
      D5	:	IN	STD_LOGIC;
      D6	:	IN	STD_LOGIC;
      D7	:	IN	STD_LOGIC;

	  KKS0	:	IN	STD_LOGIC;
      KKS1	:	IN	STD_LOGIC;
      KKS2	:	IN	STD_LOGIC;
      KKS3	:	IN	STD_LOGIC;
      KKS4	:	IN	STD_LOGIC;
      KKS5	:	IN	STD_LOGIC;
      KKS6	:	IN	STD_LOGIC;
      KKS7	:	IN	STD_LOGIC;
	  
	  CLK	:	IN	STD_LOGIC;
	  QUERY	:	IN	STD_LOGIC;
	 
	  Q0	:	INOUT	STD_LOGIC;
      Q1	:	INOUT	STD_LOGIC;
      Q2	:	INOUT	STD_LOGIC;
      Q3	:	INOUT	STD_LOGIC;
      Q4	:	INOUT	STD_LOGIC;
      Q5	:	INOUT	STD_LOGIC;
      Q6	:	INOUT	STD_LOGIC;
      Q7	:	INOUT	STD_LOGIC;

	  SYNCHRO	:	INOUT	STD_LOGIC;
	  GET		:	INOUT	STD_LOGIC;

	  MT_Q0	:	INOUT	STD_LOGIC;
      MT_Q1	:	INOUT	STD_LOGIC;
      MT_Q2	:	INOUT	STD_LOGIC;
      MT_Q3	:	INOUT	STD_LOGIC;
      MT_Q4	:	INOUT	STD_LOGIC;
      MT_Q5	:	INOUT	STD_LOGIC;
      MT_Q6	:	INOUT	STD_LOGIC;
      MT_Q7	:	INOUT	STD_LOGIC;

	  T_OVER: INOUT	STD_LOGIC;
	  T_T1	: INOUT	STD_LOGIC;
	  T_S2	: INOUT	STD_LOGIC;
	  T_C1	: INOUT	STD_LOGIC;
	  T_C2	: INOUT	STD_LOGIC;
	  T_C3	: INOUT	STD_LOGIC

);
END videomemory;

ARCHITECTURE varch OF videomemory IS

COMPONENT aa5and2
PORT
(
	A		: IN	STD_LOGIC;
	B		: IN	STD_LOGIC;
	Q		: INOUT	STD_LOGIC
);
END COMPONENT;

COMPONENT rstrigger
PORT
(
	s	: IN	STD_LOGIC;
	r   : IN	STD_LOGIC;
	q	: INOUT	STD_LOGIC
);	
END COMPONENT;

COMPONENT counter
PORT
(
	CLK		:  IN	  STD_LOGIC;
	RESET	:  IN	  STD_LOGIC;
	Q1		:  INOUT  STD_LOGIC;
	Q2		:  INOUT  STD_LOGIC;
	Q3		:  INOUT  STD_LOGIC;
	OVER  	:  INOUT  STD_LOGIC
);
END COMPONENT;

COMPONENT comp8
PORT
(
	A0 : IN STD_LOGIC;
	A1 : IN STD_LOGIC;
	A2 : IN STD_LOGIC;
	A3 : IN STD_LOGIC;
	A4 : IN STD_LOGIC;
	A5 : IN STD_LOGIC;
	A6 : IN STD_LOGIC;
	A7 : IN STD_LOGIC;

	B0 : IN STD_LOGIC;
	B1 : IN STD_LOGIC;
	B2 : IN STD_LOGIC;
	B3 : IN STD_LOGIC;
	B4 : IN STD_LOGIC;
	B5 : IN STD_LOGIC;
	B6 : IN STD_LOGIC;
	B7 : IN STD_LOGIC;

	AEQB : INOUT STD_LOGIC
);
END COMPONENT;

COMPONENT mux8x2
PORT
(
	CHOOSE : IN STD_LOGIC;
	A0 : IN STD_LOGIC;
	A1 : IN STD_LOGIC;
	A2 : IN STD_LOGIC;
	A3 : IN STD_LOGIC;
	A4 : IN STD_LOGIC;
	A5 : IN STD_LOGIC;
	A6 : IN STD_LOGIC;
	A7 : IN STD_LOGIC;

	B0 : IN STD_LOGIC;
	B1 : IN STD_LOGIC;
	B2 : IN STD_LOGIC;
	B3 : IN STD_LOGIC;
	B4 : IN STD_LOGIC;
	B5 : IN STD_LOGIC;
	B6 : IN STD_LOGIC;
	B7 : IN STD_LOGIC;

	Q0 : INOUT STD_LOGIC;
	Q1 : INOUT STD_LOGIC;
	Q2 : INOUT STD_LOGIC;
	Q3 : INOUT STD_LOGIC;
	Q4 : INOUT STD_LOGIC;
	Q5 : INOUT STD_LOGIC;
	Q6 : INOUT STD_LOGIC;
	Q7 : INOUT STD_LOGIC	
);
END COMPONENT;

COMPONENT mem8x8
PORT( CLK	:	IN	STD_LOGIC;
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

vm_mux : mux8x2
PORT MAP ( GET, Q0,    Q1,    Q2, 	 Q3,    Q4,    Q5,    Q6,    Q7, 
                D0,    D1,    D2, 	 D3,    D4,    D5,    D6,    D7, 
                MT_Q0, MT_Q1, MT_Q2, MT_Q3, MT_Q4, MT_Q5, MT_Q6, MT_Q7 );

vm_mem8x8 : mem8x8
PORT MAP ( CLK, MT_Q0, MT_Q1, MT_Q2, MT_Q3, MT_Q4, MT_Q5, MT_Q6, MT_Q7, 
                Q0,    Q1,    Q2, 	 Q3,    Q4,    Q5,    Q6,    Q7 );
vm_comp : comp8
PORT MAP ( Q0,   Q1,   Q2, 	 Q3,   Q4,   Q5,   Q6,   Q7, 
           KKS0, KKS1, KKS2, KKS3, KKS4, KKS5, KKS6, KKS7, SYNCHRO );
vm_counter : counter
PORT MAP( CLK, SYNCHRO, T_C1, T_C2, T_C3, T_OVER );
vm_rs1 : rstrigger
PORT MAP( QUERY, T_OVER, T_T1 );
vm_and : aa5and2
PORT MAP( T_T1, SYNCHRO, T_S2 );
vm_rs2 : rstrigger
PORT MAP( T_S2, T_OVER, GET );

END varch;

CONFIGURATION conf OF videomemory IS
	FOR varch

		FOR vm_mux : mux8x2
			USE ENTITY work.mux8x2 (arch);
		END FOR;
		FOR vm_mem8x8 : mem8x8
			USE ENTITY work.mem8x8 (arch);
		END FOR;
		FOR vm_comp : comp8
			USE ENTITY work.comp8 (arch);
		END FOR;
		FOR vm_counter : counter
			USE ENTITY work.counter (arch);
		END FOR;
		FOR vm_rs1 : rstrigger
			USE ENTITY work.rstrigger (arch);
		END FOR;
		FOR vm_and : aa5and2
			USE ENTITY work.aa5and2 (arch);
		END FOR;
		FOR vm_rs2 : rstrigger
			USE ENTITY work.rstrigger (arch);
		END FOR;

	END FOR;
END conf;


