moduele tb_rtype;
    wire [31:0] ALU_output;
    reg [31:0]PC;
    reg reset,clk;

    SCDataPath SCDP(ALU_output,PC,reset,clk);

    initial
    begin
        $monitor("at time %0d IPC=%d, Reset=%d,clk=%d,ALU_Output=%d",$time,start_pc,reset,clk,ALU_Output);

        #0 clk=0; PC=5;
        #120 reset=1;
        #400 $stop;
    end

    always
    begin
        #20 clk=~clk;
    end
endmodule