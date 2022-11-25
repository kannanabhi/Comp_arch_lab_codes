module bit32not(not_a,a);
    input [31:0] a;
    output [31:0] not_a;

    assign not_a=~a;

endmodule