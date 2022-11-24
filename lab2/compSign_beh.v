module compSign_beh(neg,in); 
    input [3:0]in;
    output neg;
    reg neg;
    always @(in)
        if(in[3]==1) 
        begin
            neg=1;
        end
        else
            neg=0;
endmodule;