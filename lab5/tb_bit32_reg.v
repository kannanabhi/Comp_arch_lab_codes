module tb_bit32_reg;
    reg [31:0] d;
    reg clk,reset;
    
    wire [31:0]q;
    
    bit32_reg R(q,d,clk,reset);

    always@(clk)
        #5 clk<=~clk;
    initial
    begin
        clk=1'b1;
        reset=1'b0;  //reset the register
        #20 reset=1'b1;
        #20 d=32'hAFAFAFAF;
        #200 $finish;
    end
    initial
        $monitor($time," d=%h q=%h reset=%b",d,q,reset);
    
endmodule