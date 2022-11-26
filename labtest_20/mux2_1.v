module mux2_1(out, sel, in1,in2);

    input sel,in1,in2;
    output out;
    assign out= sel? in2:in1;
endmodule