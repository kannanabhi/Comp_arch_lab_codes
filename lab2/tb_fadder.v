module tb_fadder;
    reg x,y,z;
    wire s,c;
    fadder_df f1(s,c,x,y,z);
    initial
        $monitor($time," x=%1b,y=%1b,z=%1b,s=%1b,c=%1b",x,y,z,s,c);
    initial 
        begin   
            #0 x=1'b0;y=1'b0;z=1'b0;
            #4 x=1'b1;y=1'b0;z=1'b0;
            #4 x=1'b0;y=1'b1;z=1'b0;
            #4 x=1'b1;y=1'b1;z=1'b0;
            #4 x=1'b0;y=1'b0;z=1'b1;
            #4 x=1'b1;y=1'b0;z=1'b1;
            #4 x=1'b0;y=1'b1;z=1'b1;
            #4 x=1'b1;y=1'b1;z=1'b1;
        end
endmodule

