module tbRegFile32;
  reg Clock, Reset, RegWrite;
  reg [4:0] ReadReg1, ReadReg2, WriteRegNo;
  reg [31:0]  WriteData;
  wire  [31:0]  ReadData1, ReadData2;
  RegFile_32 rgf(ReadData1, ReadData2, Clock, Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData);
  initial begin
    $monitor($time, ": Reset = %b, RegWrite = %h, ReadReg1 = %h, ReadReg2 = %h, WriteRegNo = %b, WriteData = %h, ReadData1 = %h, ReadData2 = %h.", Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData, ReadData1, ReadData2);
    #0   Clock = 1'b1; ReadReg1 = 5'b00000; ReadReg2 = 5'b11111; Reset = 1'b1;
    #2   Reset = 1'b0;
    #10   Reset = 1'b1; RegWrite = 1'b1;  WriteData = 32'h00000001; WriteRegNo = 5'b00000;
    repeat(31)   begin
        #10   WriteData = WriteData + 32'h00000001;   WriteRegNo = WriteRegNo + 5'b00001;
    end
    #10   RegWrite = 1'b0;   ReadReg1 = 5'b00000;   ReadReg2 = 5'b00001;
    repeat(15)   begin
        #10   ReadReg1 = ReadReg1 + 5'b00010;   ReadReg2 = ReadReg2 + 5'b00010;
    end
    #10   $finish;
  end
  always
    #5  Clock = ~Clock;
endmodule