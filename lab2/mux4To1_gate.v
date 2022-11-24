module mux4to1_gate(out,in,sel);
    input [3:0] in;
    input [1:0] sel;
    output out;
    wire n1,n2,a1,a2,a3,a4;

    not n(n1,sel[1]);
    not nn(n2,sel[0]);

    and (a1,in[0],n1,n2);
    and (a2,in[1],n2,sel[1]);
    and (a3,in[2],sel[0],n1);
    and (a4,in[3],sel[0],sel[1]);

    or or1(out,a1,a2,a3,a4);
endmodule