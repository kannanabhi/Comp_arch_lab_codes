module tb_main_control_pla;
  reg [5:0] Op;
  wire  RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;
  main_control_pla MCU(RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, Op);
  initial begin
    $monitor($time, " Op[5] = %b, Op[4] = %b, Op[3] = %b, Op[2] = %b, Op[1] = %b, Op[0] = %b, RegDst = %b, ALUSrc = %b, MemToReg = %b, RegWrite = %b, MemRead = %b, MemWrite = %b, Branch = %b, ALUOp0 = %b, ALUOp1 = %b.", Op[5], Op[4], Op[3], Op[2], Op[1], Op[0], RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1);
    #0  Op[5] = 1'b0; Op[4] = 1'b0; Op[3] = 1'b0; Op[2] = 1'b0; Op[1] = 1'b0; Op[0] = 1'b0;
    #100  Op[5] = 1'b1; Op[4] = 1'b0; Op[3] = 1'b0; Op[2] = 1'b0; Op[1] = 1'b1; Op[0] = 1'b1;
    #100  Op[5] = 1'b1; Op[4] = 1'b0; Op[3] = 1'b1; Op[2] = 1'b0; Op[1] = 1'b1; Op[0] = 1'b1;
    #100  Op[5] = 1'b0; Op[4] = 1'b0; Op[3] = 1'b0; Op[2] = 1'b1; Op[1] = 1'b0; Op[0] = 1'b0;
    #100  $finish;
  end
endmodule