module fetch_data(num,parity,count);

    //get ripple counter data
    input [3:0]count;
    output [7:0]num;
    output parity;

    wire [7:0]num1,num2;
    wire parity1,parity2;
    //get data from mem1 & mem2
    mem1 m1(num1,parity1,count[2:0]);
    mem2 m2(num2,parity2,count[2:0]);
    
    //pull data through mux's & return
    mux2_1 p1(parity,count[3],parity1,parity2);
    mux_8bit p2(num,count[3],num1,num2);
endmodule