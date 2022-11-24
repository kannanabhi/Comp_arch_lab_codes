module tb_mux16to1_gate;
    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    mux16to1_gate mux(out,in,sel);

    initial
    begin
        $monitor($time," in=%16b | sel=%4b | out=%1b",in,sel,out);
        
    end

    initial
    begin
        #0 in=16'b1010101010101010; sel=4'b0000;
        repeat(15)
        #10    sel=sel+4'b0001;
    end
endmodule