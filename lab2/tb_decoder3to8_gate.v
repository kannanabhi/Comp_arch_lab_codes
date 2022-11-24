module tb_decoder3to8_gate;
    reg [2:0]in;
    wire [7:0]out;

    decoder3to8_gate dec(out,in[2],in[1],in[0]);

    initial
        $monitor($time," in=%3b, out=%8b",in,out);
    initial 
    begin
        #0 in=3'b000;
        repeat(7)
        #10 in=in+3'b001;
    end 
endmodule