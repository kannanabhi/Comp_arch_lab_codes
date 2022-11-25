module fadder_df(sum,cout,cin,in1,in2);
    input in1,in2,cin;
    output cout,sum;

    assign {cout,sum}=cin+in1+in2;
endmodule