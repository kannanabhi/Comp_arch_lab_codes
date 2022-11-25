module mux4to1(out,in1,in2,in3,in4,sel);
    input [31:0]in1,in2,in3,in4;
    input [1:0]sel;
    output [31:0]out;
    reg [31:0]out;

    always@(sel or in1 or in2 or in3 or in4) 
    begin
        case (sel)
            2'b00: begin
                out<=in1;
            end
            2'b01: begin
                out<=in2;
            end
            2'b10: begin
                out<=in3;
            end
            2'b11: begin
                out<=in4;
            end
        endcase
    end
endmodule