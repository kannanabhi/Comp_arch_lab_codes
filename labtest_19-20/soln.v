`timescale 1ms/1ns
module mux_2x1(out,seli,a,b);
	input seli,a,b;
	output out;
	
	assign out=seli?a:b;
endmodule

module mux_8x1(out,sel,in0,in1,in2,in3,in4,in5,in6,in7);
	input in0,in1,in2,in3,in4,in5,in6,in7;
	input [2:0]sel;
	output out;
	
	//assign out = sel[2] ? (sel[1] ? (sel[0] ? in7:in6) : (sel[0] ? in5:in4)) : (sel[1] ? (sel[0] ? in7:in6) : (sel[0] ? in7:in6));
	assign out=(sel==3'b111)?in7:(sel==3'b110)?in6:(sel==3'b101)?in5:(sel==3'b100)?in4:(sel==3'b011)?in3:(sel==3'b010)?in2:(sel==3'b001)?in1:in0;
endmodule

module mux_array(e,g,c,d);
	input [7:0] c,d,g;
	output [7:0]e;
	
	genvar j;
	generate
		for(j=0;j<8;j=j+1) 
		begin:muxloop
			mux_2x1 m1(e[j],g[j],c[j],d[j]);
		end 
	endgenerate
endmodule

module counter_3bit(count,clear,clk);
	input clear,clk;
	output reg [2:0]count;
	
	always@(posedge clk or negedge clear) begin
		if(!clear) begin
			count<=3'b000;
		end
		else begin
			count<=count+1;
		end
	end
endmodule

module decoder(out,en,count);
	input en;
	input [2:0]count;
	output reg [7:0]out;
	
	always@(en or count) begin
		
		out=8'b00000000;
		if(en) begin
			case(count)  
				3'b000: out[0]<=1;
				3'b001: out[1]<=1;
				3'b010: out[2]<=1;
				3'b011: out[3]<=1;
				3'b100: out[4]<=1;
				3'b101: out[5]<=1;
				3'b110: out[6]<=1;
				3'b111: out[7]<=1;
			endcase
		end
	end
endmodule

module memory(g,s);
	input [2:0]s;
	output reg [7:0]g;
	integer j;
	reg [7:0]mem [0:7];
	initial begin
		mem[0]=8'h01;
		mem[1]=8'h03;
		mem[2]=8'h05;
		mem[3]=8'h07;
		mem[4]=8'h0f;
		mem[5]=8'h3f;
		mem[6]=8'h7f;
		mem[7]=8'hff;
	end
	always@(s or g) begin

		j=s;
		g=mem[j];
	end
endmodule

module top_module(o,clear,clk,en,s);
	input en,clk,clear;
	input [2:0]s;
	output o;
	
	wire [2:0] count;
	wire [7:0] c,g,e;
	counter_3bit cnt(count,clear,clk);
	decoder d(c,en,count);
	memory m(g,s);
	mux_array  m1(e,g,c,8'b00000000);
	mux_8x1 m2(o,count,e[0],e[1],e[2],e[3],e[4],e[5],e[6],e[7]);
endmodule

module testbench;
	reg clk,clear,en;
	reg [2:0]s;
	wire o;
	
	initial 
		$monitor($time," clear=%b clk=%b en=%b s=%b o=%b",clear,clk,en,s,o);
	always
		#0.5 clk=~clk;
		
	top_module tm(o,clear,clk,en,s);
	initial begin
		#0 clk=0;
		en=1;
		#0 clear=0;
		#5 clear=1;
		s=3'b000;
		repeat(7)
			#8 s=s+3'b001;
		#100 $finish;
	end
endmodule
		
		
		