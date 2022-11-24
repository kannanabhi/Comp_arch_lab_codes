module tb_comp4bit_beh;
    reg [3:0] A,B;
    wire AgtB,AeqB,AltB;

    comp4bit_beh compa(A,B,AgtB,AeqB,AltB);

    initial
        $monitor($time," A=%4b, B=%4b, AgtB=%b,AeqB=%b,AltB=%b ",A,B,AgtB,AeqB,AltB);
    initial
    begin
        #0 A=4'b0000;B=4'b0000;
        #10 A=4'b1000;B=4'b1011;
        #10 A=4'b0010;B=4'b0111;
        #10 A=4'b0101;B=4'b1111;
    end
endmodule