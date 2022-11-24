module testing;
    reg [7:0] a,b,c,d,e;
    initial begin   
    a<=8'hFA;
    #1
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h",$time,a,b,c);
    b<=8'hF1;
    #1
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h",$time,a,b,c);
    c<=8'h30;
    #1
    $display("[%0t] a=0x%0h b=0x%0h c=0x%0h",$time,a,b,c);

    $display($time);
    end
endmodule