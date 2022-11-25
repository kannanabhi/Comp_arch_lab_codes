module tb_bit8_2to1mux;
    wire [31:0]out;
    reg [31:0]in1,in2;
    reg sel;

    bit32_2to1mux m1(out,sel,in1,in2);

    initial
        $monitor($time," in1=%b in2=%b sel=%b out=%b",in1,in2,sel,out);

    initial
    begin
        in1=32'b10101010_10101010_10101010_10101010;
        in2=32'b01010101_01010101_01010101_01010101;
        sel=1'b0;
        #100 sel=1'b1;
        #1000 $finish;
    end
endmodule