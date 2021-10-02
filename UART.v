`timescale 1ns/1ns
module HW1_UART(
	input [7:0]indata, 
	input clk_50M,
	input write,
	input reset_n, 
	output uart_txd
	);
	
reg [13:0]freq = 13'd0;
reg [4:0]i = 5'd0;
reg TX = 1'b1;
reg flag = 1'b0;
reg sflag = 1'b0;
reg dflag = 1'b0;
wire w_pos;
wire w_neg;
edge_detect ed1(.clk(clk_50M),.rst_n(reset_n),.data_in(write),.pos_edge(w_pos),.neg_edge(w_neg));

assign uart_txd = TX;
always@(posedge clk_50M or negedge reset_n)
begin
	if(!reset_n)
		freq <= 1'd0;
	else if(freq == 13'd5208)
		freq <= 1'd0;
	else
		freq <= freq + 1'd1;
end

always@(posedge clk_50M or negedge reset_n)
begin
	if(!reset_n)
	begin
		TX = 1'b1;
		flag = 1'b0;
	end
	else
	begin
		if(w_neg)
		begin
			flag = 1'b1;
			i = 4'd0;
			sflag = 1'b1;
		end
		if(freq == 0 && sflag == 1'b1)
		begin
			TX = 1'b0;
			sflag = 1'b0;
		end
		if(flag && !sflag)
		begin
			if(freq == 5208)
			begin
				if(i < 4'd8)
				begin
					TX = indata[i];
					i = i + 1'd1;
				end
				else
				begin
					TX = 1'b1;
					i = 4'd0;
					flag = 1'b0;
				end
			end
		end
	end
end

endmodule
