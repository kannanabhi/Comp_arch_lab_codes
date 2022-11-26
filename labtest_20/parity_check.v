module parity_check(out, parity, num);

    input [7:0]num;
    input parity;
    output out;

    assign out = ((num[0]^num[1]^num[2]^num[3]^num[4]^num[5]^num[6]^num[7])==parity);
endmodule