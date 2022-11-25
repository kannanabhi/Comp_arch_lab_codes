module tb_alu;
    reg Binvert,Carryin;
    reg [1:0]Operation;
    reg [31:0]a,b;
    wire [31:0]Result;
    wire CarryOut;

    alu myalu(Result,CarryOut,a,b,Binvert,Carryin,Operation);

    initial 
        $monitor($time," a=%h b=%h operation=%b binvert=%b carryin=%b carryout=%b result=%h",a,b,Operation,Binvert,Carryin,CarryOut,Result);
    initial
    begin
        a=32'ha5a5a5a5;
        b=32'h5a5a5a5a;
        Operation=2'b00;       //and operation
        Binvert=1'b0;
        Carryin=1'b0;          //perform and resulting in zero

        #100 Operation=2'b01;  //or operation
        #100 Operation=2'b10;  // add operation
        #100 Binvert=1'b1;     // sub operation
        #200 $finish;
    end
endmodule