module bit32_4to1mux(out,in1,in2,in3,in4,sel);
    input [31:0]in1,in2,in3,in4;
    input [1:0]sel;
    output [31:0]out;

    genvar j;
    generate
    for(j=0;j<32;j=j+1)
        begin:muxloop
            mux4to1 m1(out[j],in1[j],in2[j],in3[j],in4[j],sel[0],sel[1]);
    end 
    endgenerate
endmodule