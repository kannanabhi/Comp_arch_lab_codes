module mux16to1_gate(out,in,sel);
    input [0:15]in;
    input [0:3]sel;
    output out;
    wire [0:3]ma;

    mux4To1_gate mux1(ma[0],in[0:3],sel[2:3]);
    mux4To1_gate mux2(ma[1],in[4:7],sel[2:3]);
    mux4To1_gate mux3(ma[2],in[8:11],sel[2:3]);
    mux4To1_gate mux4(ma[3],in[12:15],sel[2:3]);
    mux4To1_gate mux5(out,ma,sel[0:1]);
endmodule