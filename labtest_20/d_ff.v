module d_ff(q,q_bar,d,clk,reset);
    input d,clk,reset;
    output q,q_bar;
    wire notd;
    not n1(notd, d);

    always@(negedge reset or posedge clk) begin
        if (!reset) begin
            q<=0;
            q_bar<=1;
        end
        else begin
            rs_ff mod(q,q_bar,d,notd,clk);
        end
    end
endmodule