module main_control_pla(RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,Memwrite,Branch,ALUOp0,ALUOp1,op);
    input [5:0] op;
    output RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,Memwrite,Branch,ALUOp0,ALUOp1;
    

    wire Rformat,lw,sw,beq;

    assign Rformat=(~op[0])&(~op[1])&(~op[2])&(~op[3])&(~op[4])&(~op[5]);
    assign lw=(op[0])&(op[1])&(~op[2])&(~op[3])&(~op[4])&(op[5]);
    assign sw=(op[0])&(op[1])&(~op[2])&(op[3])&(~op[4])&(op[5]);
    assign beq=(~op[0])&(~op[1])&(op[2])&(~op[3])&(~op[4])&(~op[5]);

    assign RegDst=Rformat;
    assign  ALUSrc=lw|sw;
    assign MemtoReg=lw;
    assign RegWrite=Rformat|lw;
    assign MemRead=lw;
    assign Memwrite=sw;
    assign Branch=beq;
    assign ALUOp0=Rformat;
    assign ALUOp1=beq;

endmodule