module d_ff(q,d,clk,reset);
    input d,clk,reset;
    output q;
    reg q;

    always@(posedge clk or negedge reset)
    begin
        if(!reset)
            q<=1'b0;
        else 
            q<=d;
    end
endmodule
            