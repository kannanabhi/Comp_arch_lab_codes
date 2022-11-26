module mux_8bit(out,sel,in1,in2);

    input sel;
    input [7:0]in1,in2;
    output [7:0]out;

    genvar i;
    generate
        for(i=0; i<8;i=i+1) 
        begin:mux_loop
            mux2_1 mod(out[i],sel,in1[i],in2[i]);
        end
    endgenerate
endmodule