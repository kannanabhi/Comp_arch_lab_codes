module  ALUControlTB;
  reg [5:0] F;
  reg ALUOp0, ALUOp1;
  wire  [2:0] Op;
  alu_control ACU(Op, F, ALUOp1,ALUOp0);
  initial begin
    $monitor($time, "ALUOp1 = %b, ALUOp0 = %b, Function Field = %b, Operation = %b.", ALUOp1, ALUOp0, F, Op);
    #0  ALUOp1 = 1'b0;  ALUOp0 = 1'b0; F = 6'b000000;
    #10 ALUOp1 = 1'b0;  ALUOp0 = 1'b1; F = 6'b000000;
    #10 ALUOp1 = 1'b1;  ALUOp0 = 1'b0; F = 6'b000000;
    #10 ALUOp1 = 1'b1;  ALUOp0 = 1'b0; F = 6'b000010;
    #10 ALUOp1 = 1'b1;  ALUOp0 = 1'b0; F = 6'b000100;
    #10 ALUOp1 = 1'b1;  ALUOp0 = 1'b0; F = 6'b000101;
    #10 ALUOp1 = 1'b1;  ALUOp0 = 1'b0; F = 6'b001010;
    #10 $finish;
  end
endmodule