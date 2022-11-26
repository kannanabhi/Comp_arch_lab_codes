module mem1(num,parity,addr);
    input [2:0]addr;
    output parity;
    output [7:0]num;

    integer j;

    wire [8:0]mem [0:7];

    mem[0]=9'b0001_1111_1;
    mem[1]=9'b0011_0001_1;
    mem[2]=9'b0001_1111_1;
    mem[3]=9'b0001_1111_1;
    mem[4]=9'b0001_1111_1;
    mem[5]=9'b0001_1111_1;
    mem[6]=9'b0001_1111_1;
    mem[7]=9'b0001_1111_1;

    always@(addr) begin
        j=addr;
        num=mem[j][7:0];
        parity=mem[j][8];
    end
endmodule
