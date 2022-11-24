module testbench;
    reg a,b,c;
    wire f;
    mux2to1_beh muxgate(a,b,c,f);
    initial
        begin
            $monitor(,$time,"a=%b,b=%b,c=%b f=%b",a,b,c,f);
            #0 a=1'b0; b=1'b1;
            #2 c=1'b1;
            #5 c=1'b0;
            #10 a=1'b1; b=1'b0;
            #15 c=1'b0;
            #20 c=1'b1;
            #100 $finish;
        end 
endmodule
