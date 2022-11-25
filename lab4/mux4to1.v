module mux4to1(out,in1,in2,in3,in4,sel1,sel2);
    output out;
    input in1,in2,in3,in4,sel1,sel2;

    wire not_sel1,not_sel2,outA,outB,outC,outD;

    not n1(not_sel1,sel1),
        n2(not_sel2,sel2);
    

    and a1(outA,in1,not_sel1,not_sel2),
        a2(outB,in2,sel1,not_sel2),
        a3(outC,in3,not_sel1,sel2),
        a4(outD,in4,sel1,sel2);
    or or1(out,outA,outB,outC,outD);
endmodule