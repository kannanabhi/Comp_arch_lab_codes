module tbRegFile4;
  reg Clock, Reset, RegWrite;
  reg [1:0] ReadReg1, ReadReg2, WriteRegNo;
  reg [31:0]  WriteData;
  wire  [31:0]  ReadData1, ReadData2;
  RegFile rgf(ReadData1, ReadData2, Clock, Reset,  ReadReg1, ReadReg2,WriteData, WriteRegNo, RegWrite);
  initial begin
    $monitor($time, ": Reset = %b, RegWrite = %b, ReadReg1 = %b, ReadReg2 = %b, WriteRegNo = %b, WriteData = %b, ReadData1 = %b, ReadData2 = %b.", Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData, ReadData1, ReadData2);
    #0  Clock = 1'b1; ReadReg1 = 2'b00; ReadReg2 = 2'b01; Reset = 1'b1;
    #2  Reset = 1'b0;
    #10 Reset = 1'b1; RegWrite = 1'b1;  WriteData = 32'hF0F0F0F0; WriteRegNo = 2'b00;
    #10 RegWrite = 1'b1;  WriteData = 32'hF8F8F8F8; WriteRegNo = 2'b01;
    #10 RegWrite = 1'b1;  WriteData = 32'hFAFAFAFA; WriteRegNo = 2'b10;
    #10 RegWrite = 1'b1;  WriteData = 32'hFFFFFFFF; WriteRegNo = 2'b11;
    #10 RegWrite = 1'b0;
    #10 ReadReg1 = 2'b00; ReadReg2 = 2'b01;
    #10 ReadReg1 = 2'b10; ReadReg2 = 2'b11;
    #10 $finish;
  end
  always
    #5  Clock = ~Clock;
endmodule