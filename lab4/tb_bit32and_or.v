module tb_bit32and_or;
    wire [31:0]out;
    reg [31:0]in1,in2;

    bit32and band(out,in1,in2);
    //bit32or bor(out,in1,in2);

    initial
        $monitor($time," in1=%h in2=%h out=%h",in1,in2,out);
    initial
    begin
        in1=32'hA5A5;
        in2=32'h5A5A;
        #100 in1=32'h5A5A;
        #400 $finish;
    end
endmodule