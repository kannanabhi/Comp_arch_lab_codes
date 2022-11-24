module mux2to1_beh(a,b,s,f);
    input a,b,s;
    output f;
    reg f;
    always@(s or a or b) 
        if(s==1) f=a;
        else f=b;
endmodule