module tb_bit32_fadder;
    wire [31:0]out;
    wire carry;
    reg [31:0]in1,in2;
    reg cin;

    bit32_fadder fadd(out,carry,cin,in1,in2);

    initial 
        $monitor($time," in1=%h in2=%h cin=%b | out=%h carry=%b",in1,in2,cin,out,carry);
    initial
    begin
        in1=32'h8000_0000;
        in2=32'h8000_0000;
        cin=1'b0;
        #100 in1=32'h0000_8000;
        cin=1'b1;

    end
endmodule