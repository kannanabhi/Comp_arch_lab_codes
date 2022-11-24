module tb_dff_clear;
    reg d,clk,reset;
    wire q;

    dff_async_clear dff(q,d,reset,clk);

    always @(posedge clk)
    begin
        $display($time," d=%b, clk=%b, reset=%b, q=%b\n",d,clk,reset,q);
    end

    initial
    begin
        forever
        begin
            #0 clk=0;
            #5 clk=1;
            #5 clk=0;
        end
    end

    initial 
    begin
        #0 d=0; reset=1;
        #4 d=0; reset=0;
        #50 d=1; reset=1;
        #20 d=0; reset=0;
        #30 $finish;
    end
endmodule
        