//
// Module TUTORIAL.Control.fsm
//
// Created:
//          by - User.UNKNOWN (VBOX)
//          at - 14:26:23 23.04.2017
//
// Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
//
`resetall
`timescale 1ns/10ps
module Control( 
   clk, 
   d, 
   reset, 
   start, 
   stop, 
   zero, 
   beep, 
   clear, 
   hold, 
   load
);


// Internal Declarations

input        clk;
input  [9:0] d;
input        reset;
input        start;
input        stop;
input        zero;
output       beep;
output       clear;
output       hold;
output       load;


wire clk;
wire [9:0] d;
wire reset;
wire start;
wire stop;
wire zero;
reg beep;
reg clear;
reg hold;
reg load;
// Declare any pre-registered internal signals
reg beep_int;

// Module Declarations
parameter   ZEROS   =   10'b0;

// State encoding
parameter 
          flush     = 4'd0,
          getkey    = 4'd1,
          load_t    = 4'd2,
          load_u    = 4'd3,
          standby   = 4'd4,
          alarm     = 4'd5,
          counting  = 4'd6,
          suspended = 4'd7,
          end_count = 4'd8;

reg [3:0] current_state, next_state;
// pragma state_vector current_state

//-----------------------------------------------------------------
// Next State Block for machine csm
//-----------------------------------------------------------------
always @(
   current_state or 
   d or 
   start or 
   stop or 
   zero
)
begin : next_state_block_proc
   case (current_state) 
      flush: begin
         if (d!=ZEROS)
            next_state = load_u;
         else
            next_state = flush;
      end
      getkey: begin
         if (start)
            next_state = standby;
         else if (d!=ZEROS)
            next_state = load_u;
         else if (stop)
            next_state = flush;
         else
            next_state = getkey;
      end
      load_t: begin
         if (d!=ZEROS)
            next_state = getkey;
         else
            next_state = load_t;
      end
      load_u: begin
         next_state = load_t;
      end
      standby: begin
         if (zero)
            next_state = alarm;
         else if (start)
            next_state = counting;
         else
            next_state = standby;
      end
      alarm: begin
         if (stop)
            next_state = end_count;
         else
            next_state = alarm;
      end
      counting: begin
         if (zero)
            next_state = alarm;
         else if (stop)
            next_state = suspended;
         else
            next_state = counting;
      end
      suspended: begin
         if (~stop)
            next_state = counting;
         else
            next_state = suspended;
      end
      end_count: begin
         if (stop)
            next_state = flush;
         else
            next_state = end_count;
      end
      default: 
         next_state = flush;
   endcase
end // Next State Block

//-----------------------------------------------------------------
// Output Block for machine csm
//-----------------------------------------------------------------
always @(
   current_state
)
begin : output_block_proc

   // Combined Actions
   case (current_state) 
      flush: begin
         hold = 1; 
         clear = 1;  
         load = 0;
      end
      getkey: begin
         hold = 1; 
         clear = 0;  
         load = 0;
      end
      load_t: begin
         hold = 1; 
         clear = 0;  
         load = 0;
      end
      load_u: begin
         hold = 1 ; 
         clear = 0;  
         load = 1;
      end
      standby: begin
         hold = 1;  
         clear = 0;
         load = 0;
      end
      alarm: begin
         load = 0; 
         clear = 1; 
         load = 0;
         beep_int = 1;
      end
      counting: begin
         hold = 0;
         clear = 0;
      end
      suspended: begin
         hold = 1;
         clear = 0;
         load = 0;
      end
      end_count: begin
         hold = 1;
         clear = 1;
         load = 0;
      end
      default: begin
      end
   endcase
end // Output Block

//-----------------------------------------------------------------
// Clocked Block for machine csm
//-----------------------------------------------------------------
always @(
   negedge clk or 
   posedge reset
) 
begin : clocked_block_proc
   if (reset) begin
      current_state <= flush;
      // Reset Values
      beep <= 0;
   end
   else 
   begin
      current_state <= next_state;
      // Registered output assignments
      beep <= beep_int;
   end
end // Clocked Block

endmodule // Control