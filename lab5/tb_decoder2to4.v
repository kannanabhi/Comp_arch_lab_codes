module tb_decoder2to4;
    reg [1:0] reg_no;
    wire [3:0]register;

    decoder2to4 dec(register,reg_no);

    initial
        $monitor($time," reg_no=%b register=%b ",reg_no,register);
    
    initial 
    begin
        #0 reg_no=2'b00;
        #10 reg_no<=2'b01;
        #10 reg_no<=2'b10;
        #10 reg_no<=2'b11;
    end
endmodule