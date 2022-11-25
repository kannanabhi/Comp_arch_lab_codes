module bit32_2to1mux(out,sel,in1,in2);
    input [31:0]in1,in2;
    input sel;
    output [31:0]out;

    genvar j;
    generate
        for(j=0;j<32;j=j+1)
            begin:muxloop
                mux2to1 m1(out[j],sel,in1[j],in2[j]);
            end
    endgenerate
endmodule