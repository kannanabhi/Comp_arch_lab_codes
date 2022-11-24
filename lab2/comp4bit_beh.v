module comp4bit_beh(A,B,AgtB,AeqB,AltB);
    input [3:0] A,B;
    output AgtB,AeqB,AltB;
    wire signA,signB;
    reg AgtB,AltB,AeqB;
    compSign_beh s1(signA,A);
    compSign_beh s2(signB,B);

    always @(A or B or signA or signB)
        if(signA==1 && signB==0)
        begin
            AgtB=0;
            AltB=1;
            AeqB=0;
        end
        else if(signA==0 && signB==1)
        begin   
            AgtB=1;
            AltB=0;
            AeqB=0;
        end
        else if (A>B) 
        begin
            AgtB=1;
            AltB=0;
            AeqB=0;
        end
        else if(A==B)
        begin
            AgtB=0;
            AltB=0;
            AeqB=1;
        end
        else 
        begin
            AgtB=0;
            AltB=1;
            AeqB=0;
        end
endmodule