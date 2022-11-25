module bit32_fadder(out,cout,cin,in1,in2);
    input [31:0]in1,in2;
    input cin;
    output cout;
    output [31:0]out;

    wire [30:0] carryout;
    //reg [31:0] out;

    fadder_df fadd0(out[0],carryout[0],cin,in1[0],in2[0]);
    genvar j;
    generate
    for(j=1;j<31;j=j+1)
        begin:faddloop
            fadder_df fadd(out[j],carryout[j],carryout[j-1],in1[j],in2[j]);
        end 
    endgenerate
    fadder_df fadd1(out[31],cout,carryout[30],in1[31],in2[31]);
endmodule