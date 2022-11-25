module tb_shiftreg;
    parameter n=4;
    wire [n-1:0] Q;
    reg EN,in,CLK;

    shiftreg shifte(Q,EN,in,CLK);

    initial
    begin
        CLK=0;
    end

    always  
        #2 CLK=~CLK;
    
    initial 
    $monitor($time," EN=%b in=%b Q=%b\n",EN,in,Q);

    initial
    begin
        in=0; EN=0;
        #4 in=1; EN=1;
        #4 in=1; EN=0;
        #4 in=0; EN=1;
        #5 $finish;
    end
endmodule