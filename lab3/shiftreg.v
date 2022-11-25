module shiftreg(Q,EN,in,CLK);
    parameter n=4;
    input EN,in,CLK;
    output [n-1:0] Q;
    reg [n-1:0] Q;

    initial
        Q=4'd10;
        always@(posedge CLK)
        begin
            if(EN)
                Q={in,Q[n-1:1]};
                //Q={in,Q[3],Q[2],Q[1]};
        end
endmodule