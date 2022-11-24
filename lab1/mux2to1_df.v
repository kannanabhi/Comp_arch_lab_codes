module mux2to1_df(a,b,c,f);
    input a,b,c;
    output f;
    assign f=c?a:b;
endmodule