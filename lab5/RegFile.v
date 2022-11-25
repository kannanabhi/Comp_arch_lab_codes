module RegFile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
    input clk,reset,RegWrite;
    input [31:0]ReadReg1,ReadReg2,WriteReg;
    input [31:0]WriteData;
    output [31:0]ReadData1,ReadData2;

    