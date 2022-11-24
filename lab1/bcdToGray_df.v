module bcdToGray_df(Out,In);
    input [3:0]In;
    output [3:0]Out;
    assign Out[3]=In[3];
    //assign Out[2]=In[3]^In[2];
    //assign Out[1]=In[2]^In[1];
    //assign Out[0]=In[0]^In[1];

    assign Out[2:0]=In[3:1]^In[2:0];
endmodule