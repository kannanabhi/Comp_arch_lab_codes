module tb_bit32_4to1mux;
    wire [31:0]out;
    reg [31:0]in1,in2,in3,in4;
    reg [1:0]sel;

    bit32_4to1mux m1(out,in1,in2,in3,in4,sel);

    initial
        $monitor($time," in1=%h in2=%h in3=%h in4=%h sel=%b out=%h",in1,in2,in3,in4,sel,out);
    initial
    begin
        in1=32'b10101010_10101010_10101010_10101010;
        in2=32'b01010101_01010101_01010101_01010101;
        in3=32'b10011001_10011001_10011001_10011001;
        in4=32'b01100110_01100110_01100110_01100110;

        sel=2'b00;
        #100 sel=2'b01;
        #100 sel=2'b10;
        #100 sel=2'b11;
    end
endmodule