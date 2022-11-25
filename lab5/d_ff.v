module d_ff(q,d,clk,reset);
    input d,clk,reset;
    output q;

    always(posedge clk or posedge reset)
    begin
        if(reset)
            q<=0;
        else 
        begin
            