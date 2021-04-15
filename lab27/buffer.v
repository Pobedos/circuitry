module buffer(clk, reset, write, read, data, out);

input clk, reset, write, read;
input data;
output [0:7] out;

wire dataVar;
reg [0:7] buff;
reg [0:7] outVar;

assign dataVar = data;

integer i;

always @(posedge clk)
begin
	if(reset == 0)
	begin
		for(i = 0; i < 8; i = i + 1)
		begin
			buff[i] <= 0;
		end
	end
	else if(clk)
	begin
		if(write == 1)
		begin
			for(i = 0; i < 7; i = i + 1)
			begin
				buff[i] <= buff[i + 1];
			end
			buff[7] <= dataVar;
		end
	end
	
	if(clk)
	begin
		if(read == 0)
		begin
			for(i = 0; i < 8; i = i + 1)
			begin
				outVar[i] <= 0;
			end
		end
		else if(read == 1)
		begin
			for(i = 0; i < 8; i = i + 1)
			begin
				outVar[i] <= buff[i];
			end
		end
	end
	
end

assign out = {outVar[7], outVar[6], outVar[5], outVar[4], outVar[3], outVar[2], outVar[1], outVar[0]};

endmodule