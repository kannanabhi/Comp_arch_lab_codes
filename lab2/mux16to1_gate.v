module mux16to1_gate(out,in,sel);
    input [15:0]in;
    input [3:0]sel;
    output out;
    wire [3:0]ma;

    mux4to1_gate mux1(ma[0],in[3:0],sel[1:0]);
    mux4to1_gate mux2(ma[1],in[7:4],sel[1:0]);
    mux4to1_gate mux3(ma[2],in[11:8],sel[1:0]);
    mux4to1_gate mux4(ma[3],in[15:12],sel[1:0]);
    mux4to1_gate mux5(out,ma[3:0],sel[3:2]);
endmodule