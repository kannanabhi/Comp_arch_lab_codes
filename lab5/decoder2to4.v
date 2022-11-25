module decoder2to4(register,reg_no);
    //it takes a 2bit input (the register code) and returns which register it symbolise
    input [1:0]reg_no;
    output [3:0]register;
    reg [3:0] register;

    integer i;



    always@(reg_no) 
    begin
        for(i=0;i<4;i++)
            register[i]<=0;

        case(reg_no)
            2'b00: register[0]<=1;
            2'b01: register[1]<=1;
            2'b10: register[2]<=1;
            2'b11: register[3]<=1;
        endcase
    end
endmodule
