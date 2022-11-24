module bcdToGray_beh(Out,In);
    input [3:0]In;
    integer i;
    output [3:0]Out;
    reg [3:0]Out;
    always@(In)
        begin   
            Out[3]=In[3];
            for(i=3; i>0; i=i-1)
                Out[i-1]=In[i]^In[i-1];
        end
endmodule