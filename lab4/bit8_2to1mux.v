module bit8_2to1mux(out,sel,in1,in2);
    input [7:0]in1,in2;
    output [7:0]out;
    input sel;
    

    genvar j;
    generate 
    for(j=0;j<8;j=j+1) 
    begin: mux_loop
        mux2to1 m1(out[j],sel,in1[j],in2[j]);
    end
    endgenerate
endmodule