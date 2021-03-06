module DTrigger (Result, Data, Clock, Reset, Ewr, regg); 
   input  Data, Clock, Reset, Ewr;
   output Result, regg;
   reg Res, Buf;
 
   always @(negedge Clock) 
      begin 
   if (Reset) 
      Res = 0; 
   else 
     begin 
       if (!Ewr) 
          begin 
            Res = Data; 
            Buf = Data; 
          end 
       else 
         Res = Buf; 
     end 
  end 
    assign regg = Buf; 
  assign Result = !Res; 
endmodule 

 
module MainRegister (OUTRESULT, EWR, CLOCK, RESET, DATA, EDY, REGEN); 
  integer i; 
  parameter numbits=7;
  input [numbits:0] DATA;
  input EWR, CLOCK, RESET, EDY;                
  output [numbits:0] OUTRESULT, REGEN; 
  reg [numbits:0] res; 
  wire [numbits:0] Res; 
  DTrigger Dtrig0 (Res[0], DATA[0], CLOCK, RESET, EWR, REGEN[0]); 
  DTrigger Dtrig1 (Res[1], DATA[1], CLOCK, RESET, EWR, REGEN[1]); 
  DTrigger Dtrig2 (Res[2], DATA[2], CLOCK, RESET, EWR, REGEN[2]); 
  DTrigger Dtrig3 (Res[3], DATA[3], CLOCK, RESET, EWR, REGEN[3]); 
  DTrigger Dtrig4 (Res[4], DATA[4], CLOCK, RESET, EWR, REGEN[4]); 
  DTrigger Dtrig5 (Res[5], DATA[5], CLOCK, RESET, EWR, REGEN[5]); 
  DTrigger Dtrig6 (Res[6], DATA[6], CLOCK, RESET, EWR, REGEN[6]); 
  DTrigger Dtrig7 (Res[7], DATA[7], CLOCK, RESET, EWR, REGEN[7]); 

  always @(posedge CLOCK) 
     begin 
  if (RESET) 
     for (i=0; i<=7; i=i+1) 
         res[i] = 0; 
  else 
    begin 
      if (~EDY) 
         res = ~Res; 
      else res = 0; 
    end 
end 
  assign OUTRESULT = res; 
endmodule 