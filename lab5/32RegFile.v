module RegFile_32(ReadData1, ReadData2, Clock, Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData);
    input Clock, Reset, RegWrite;
    input [4:0] ReadReg1, ReadReg2, WriteRegNo;
    input [31:0]  WriteData;
    output  [31:0]  ReadData1, ReadData2;
    wire  [31:0]  Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31;
    wire  [31:0] Decode;
    wire  [31:0]c;


    genvar  j;
    decoder5to32 dec(Decode, WriteRegNo);
    generate
        for(j = 0; j < 32; j = j + 1) begin:  and_loop
        and g(c[j], RegWrite, Decode[j], Clock);
        end
    endgenerate

    bit32_reg r0(Data0, WriteData, c[0], Reset);
    bit32_reg r1(Data1, WriteData, c[1], Reset);
    bit32_reg r2(Data2, WriteData, c[2], Reset);
    bit32_reg r3(Data3, WriteData, c[3], Reset);
    bit32_reg r4(Data4, WriteData, c[4], Reset);
    bit32_reg r5(Data5, WriteData, c[5], Reset);
    bit32_reg r6(Data6, WriteData, c[6], Reset);
    bit32_reg r7(Data7, WriteData, c[7], Reset);
    bit32_reg r8(Data8, WriteData, c[8], Reset);
    bit32_reg r9(Data9, WriteData, c[9], Reset);
    bit32_reg r10(Data10, WriteData, c[10], Reset);
    bit32_reg r11(Data11, WriteData, c[11], Reset);
    bit32_reg r12(Data12, WriteData, c[12], Reset);
    bit32_reg r13(Data13, WriteData, c[13], Reset);
    bit32_reg r14(Data14, WriteData, c[14], Reset);
    bit32_reg r15(Data15, WriteData, c[15], Reset);
    bit32_reg r16(Data16, WriteData, c[16], Reset);
    bit32_reg r17(Data17, WriteData, c[17], Reset);
    bit32_reg r18(Data18, WriteData, c[18], Reset);
    bit32_reg r19(Data19, WriteData, c[19], Reset);
    bit32_reg r20(Data20, WriteData, c[20], Reset);
    bit32_reg r21(Data21, WriteData, c[21], Reset);
    bit32_reg r22(Data22, WriteData, c[22], Reset);
    bit32_reg r23(Data23, WriteData, c[23], Reset);
    bit32_reg r24(Data24, WriteData, c[24], Reset);
    bit32_reg r25(Data25, WriteData, c[25], Reset);
    bit32_reg r26(Data26, WriteData, c[26], Reset);
    bit32_reg r27(Data27, WriteData, c[27], Reset);
    bit32_reg r28(Data28, WriteData, c[28], Reset);
    bit32_reg r29(Data29, WriteData, c[29], Reset);
    bit32_reg r30(Data30, WriteData, c[30], Reset);
    bit32_reg r31(Data31, WriteData, c[31], Reset);
    mux32to1 m0(ReadData1, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31, ReadReg1);
    mux32to1 m1(ReadData2, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31, ReadReg2);
endmodule