module ALU (command_code,xdata,ydata,clock,result, 
flagZ,flagO,flagN); 
parameter numbits=3; 
 
   input    [2:0] command_code;
   input    clock;      
   input    [numbits:0] xdata, ydata;
   output   [2*numbits+1:0] result; 
   output   flagZ,flagO,flagN;  

   reg      [2*numbits+1:0] res; 
   reg      z,o,n; 
 

task Disable; 
 
  output [2*numbits+1:0] Disable; 
  input  [numbits:0] x, y; 
  begin 
    y=x;     
    Disable=x; 
  end 
endtask 


task Summator; 
  output [2*numbits+1:0] Summator; 
  input  [numbits:0] x, y; 
  input  c_in; 

  integer i;    
  reg a,b,c,d,a1,b1,c1,bit,summa;
 
  begin 

  for (i=0; i<=numbits; i=i+1) 

    begin 
       a= ~x[i]&~y[i]&c_in; 
       b= ~x[i]&y[i]&~c_in; 
       c=c_in&x[i]&y[i]; 
       d=x[i]&~y[i]&~c_in; 

       Summator[i]=a|b|c|d; 
       a1=x[i]&y[i]&~c_in; 
       b1=x[i]&~y[i]&c_in; 
       c1=~x[i]&y[i]&c_in; 

       bit=c|a1|b1|c1; 
       c_in=bit; 
    end 
 
    Summator[numbits+1]=bit; 
    for (i=numbits+2; i<=2*numbits+1; i=i+1) 
         Summator[i]=0; 
   end 
endtask 


task Substance; 
  output [2*numbits+1:0] Substance; 
  input  [numbits:0] x, y; 
  begin 
    if (x>=y) 
       Substance=x-y; 
    else  
       Substance=y-x; 
  end 
endtask 


task Multiple; 
  output [2*numbits+1:0] Multiple; 
  input  [numbits:0] x, y; 
  begin 
    if ((x>=0 && y>=0)||(x<=0 && y<=0)) 
       Multiple=x*y; 

    if ((x>0 && y<0)||(x<0 && y>0)) 
       Multiple=-x*y; 
  end 
endtask 


task Divide; 
  output [2*numbits+1:0] Divide; 
  input  [numbits:0] x, y; 
  begin 

    if (!y)  
       Divide='bx; 

    else 
      begin 

        if ((x>=0 && y>0)||(x<=0 && y<0)) 
           Divide=x/y; 

        if ((x>0 && y<0)||(x<0 && y>0)) 
           Divide=-x/y; 
      end 
  end 
endtask  


task Operation_and; 
  output [2*numbits+1:0] Operation_and; 
  input  [numbits:0] x, y; 
  integer i; 
  begin 
    for (i=0; i<=numbits; i=i+1) 
        Operation_and[i]=x[i]&&y[i]; 

    for (i=numbits+1; i<=2*numbits+1; i=i+1) 
        Operation_and[i]=0; 
  end 
endtask 


task Operation_or; 
  output [2*numbits+1:0] Operation_or; 
  input  [numbits:0] x, y; 
  integer i; 
  begin 
    for (i=0; i<=numbits; i=i+1) 
        Operation_or[i]=x[i]||y[i]; 

    for (i=numbits+1; i<=2*numbits+1; i=i+1) 
        Operation_or[i]=0; 
  end 
endtask 


task Operation_not; 
  output [2*numbits+1:0] Operation_not; 
  input  [numbits:0] x, y; 
  integer i; 
  begin 
    y=x; 
    for (i=0; i<=numbits; i=i+1) 
        Operation_not[i]=~x[i]; 

    for (i=numbits+1; i<=2*numbits+1; i=i+1) 
        Operation_not[i]=0; 
  end 
endtask 
 

   always @(posedge clock)  
   begin 
   case (command_code) 
         'b000: 
            begin 
              Disable(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               if (res<0) 
                   n=1; 
               else  
                   n=0; 
               o=0; 
            end 
         'b001: 
            begin 
               Summator(res,xdata,ydata,0); 
               z = (res==0) ? 1 : 0; 
               if (res<0) 
                   n=1; 
               else  
                   n=0; 
               o=0; 
            end 
         'b010: 
            begin 

             Substance(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               if (xdata<ydata) 
                   n=1; 
               else  
                   n=0; 
               o=0; 
            end 
         'b011: 
            begin 
Multiple(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               if (res<0) 
                   n=1; 
               else 
                   n=0; 
               if ((xdata<0&&ydata>0)||(xdata>0&&ydata<0)) 
                  n=1; 
               else  

                  n=0; 
               o=0; 
            end 
         'b100: 
            begin  
               o=(ydata==0) ? 1 : 0; 
               Divide(res,xdata,ydata); 
             z = (res==0) ? 1 : 0; 
               if ((xdata<0&&ydata>0)||(xdata>0&&ydata<0)) 
                  n=1; 
               else  
                  n=0; 
            end  
         'b101: 
            begin 
               Operation_and(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               n=0; 
 
               o=0; 
            end 
         'b110: 
            begin 
           Operation_or(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               n=0; 
               o=0; 
            end 
         'b111: 
            begin 
               Operation_not(res,xdata,ydata); 
               z = (res==0) ? 1 : 0; 
               n=0; 
               o=0; 
              end 
          default: res='bx;  
    endcase 
   end 
 
   assign result=res; 
   assign flagZ=z;   
   assign flagN=n;    
   assign flagO=o;   
endmodule 
