module mux2to1(out,sel,A,B);
    input A,B,sel;
    output out;
    wire sel1,outA,outB;

    not n1(sel1,sel);

    and a1(outA,A,sel1);
    and a2(outB,B,sel);
    or or1(out,outA,outB);
endmodule