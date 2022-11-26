module bit32_reg(q,d,clk,reset);
    parameter n=32;
    input [n-1:0] d;
    input clk,reset;
    output [n-1:0]q;


    genvar j;
    generate
    for(j=0;j<n;j=j+1)
        begin:dffloop
            d_ff_async dff(q[j],d[j],clk,reset);
        end
    endgenerate

endmodule