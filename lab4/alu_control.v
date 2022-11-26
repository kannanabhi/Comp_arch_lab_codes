module alu_control(op,aluop1,aluop0);
    output [1:0]op;
    input aluop1,aluop0;
    input [5:0] funcfield;

    