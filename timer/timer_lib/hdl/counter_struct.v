//
// Module timer_lib.Counter.struct
//
// Created:
//          by - User.UNKNOWN (VBOX)
//          at - 01:16:35 26.04.2017
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
//

`resetall
`timescale 1ns/10ps
module Counter( 
   clear, 
   clk, 
   dat_in, 
   hold, 
   load, 
   high, 
   low, 
   zero
);


// Internal Declarations

input        clear;
input        clk;
input  [3:0] dat_in;
input        hold;
input        load;
output [3:0] high;
output [3:0] low;
output       zero;


wire        clear;
wire        clk;
wire [3:0]  dat_in;
wire        hold;
wire        load;
wire [3:0]  high;
wire [3:0]  low;
wire        zero;

// Local declarations
parameter gnd = 4'b0;


// Internal signal declarations
wire [3:0] dout;
wire       dout1;
wire       zero1;
wire       zero2;


// Instances 
BCDCounter #(5) I0( 
   .cnten    (hold), 
   .clear    (clear), 
   .clk      (clk), 
   .load     (load), 
   .dat_in   (dat_in), 
   .carry_in (high), 
   .count    (low), 
   .zero     (zero1)
); 

BCDCounter #(5) I1( 
   .cnten    (dout1), 
   .clear    (clear), 
   .clk      (clk), 
   .load     (load), 
   .dat_in   (dat_in), 
   .carry_in (dout), 
   .count    (high), 
   .zero     (zero2)
); 


// ModuleWare code(v1.7) for instance 'I2' of 'gnd'
assign dout = 4'b0000;

// ModuleWare code(v1.7) for instance 'I3' of 'nor'
assign zero = ~(zero1 | zero2);

// ModuleWare code(v1.7) for instance 'I4' of 'or1'
assign dout1 = hold | zero1;

endmodule // Counter

