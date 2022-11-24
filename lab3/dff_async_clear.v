module dff_async_clear(q,d,clearb,clock);
    input d,clearb,clock;
    output q;
    reg q;
    // as soon as values change we reflect it in the output
    always @(negedge clearb or posedge clock)
    begin
        if(!clearb) q<=1'b0;
        else q<=d;
    end
endmodule