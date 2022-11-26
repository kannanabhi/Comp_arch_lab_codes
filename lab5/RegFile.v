module RegFile(ReadData1,ReadData2,clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite);
    input clk,reset,RegWrite;
    input [1:0]ReadReg1,ReadReg2,WriteReg;
    input [31:0]WriteData;
    output [31:0]ReadData1,ReadData2;
    
    wire [31:0] w0,w1,w2,w3;
    wire [3:0]decode;
    wire c0,c1,c2,c3;

    decoder2to4 dec(decode,WriteReg);
    //code for writing something
    and g0(c0,RegWrite,decode[0],clk),
        g1(c1,RegWrite,decode[1],clk),
        g2(c2,RegWrite,decode[2],clk),
        g3(c3,RegWrite,decode[3],clk);
    bit32_reg r1(w0,WriteData,c0,reset);
    bit32_reg r2(w1,WriteData,c1,reset);
    bit32_reg r3(w2,WriteData,c2,reset);
    bit32_reg r4(w3,WriteData,c3,reset);

    //code for reading something
    mux4to1 m0(ReadData1,w0,w1,w2,w3,ReadReg1);
    mux4to1 m1(ReadData2,w0,w1,w2,w3,ReadReg2);
endmodule
    

    