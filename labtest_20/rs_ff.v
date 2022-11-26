module rs_ff(q,q_bar,s,r,clk);

input s,r,clk;
output reg q,q_bar;

always@(posedge clk) begin
    if (s==0) begin
        q<=0; q_bar<=1;
    end
    else begin
        q<=1; q_bar<=0;
    end
end
endmodule