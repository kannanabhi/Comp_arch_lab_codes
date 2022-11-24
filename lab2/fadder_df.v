module fadder_df(sum,carry,x,y,z);
    input x,y,z;
    wire [7:0]in;
    output sum,carry;
    decoder3to8_gate dec(in,x,y,z);
    assign sum=in[1]|in[2]|in[4]|in[7] ,
           carry=in[3]|in[5]|in[6]|in[7];
endmodule
