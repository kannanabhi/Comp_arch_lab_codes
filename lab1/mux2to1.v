module mux2to1_gate(a,b,s,f); 
    input a,b,s;
    output f;
    wire c,d,e;

    not n1(e,s);
    and a1(c,a,s);
    and a2(d,b,e);
    or o1(f,c,d);
endmodule