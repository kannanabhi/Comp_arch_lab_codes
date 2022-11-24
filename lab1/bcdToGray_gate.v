module bcdToGray_gate(Out,In);
    input [3:0]In;
    output [3:0]Out;
    buf b1(Out[3],In[3]);
    xor x1(Out[2],In[3],In[2]);
    xor x2(Out[1],In[2],In[1]);
    xor x3(Out[0],In[1],In[0]);
endmodule