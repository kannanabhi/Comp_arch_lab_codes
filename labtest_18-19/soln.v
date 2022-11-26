`timescale 1ms/1ms

module d_ff(q,d,clk);
    input clk,d;
    output reg q;

    always@(posedge clk)  begin
        q<=d;
    end
endmodule

module ControlLogic(T,X,Z,S,clk);
    input X,Z,S,clk;
    output [2:0]T;

    wire x_not,z_not,s_not;
    wire d0t1,d0t2,d1t1,d1t2,d1t3,d2t1,d2t2;

    not n1(x_not,X),
        n2(z_not,Z),
        n3(s_not,S);
    and a1(d0t1,T[0],s_not),
        a2(d0t2,T[2],Z),
        a3(d1t1,T[0],S),
        a4(d1t2,T[2],x_not,z_not),
        a5(d1t3,T[1],x_not),
        a6(d2t1,T[1],x),
        a7(d2t2,T[2],z_not,X);
    or o1(d1,d0t1,d0t2),
       o2(d2,d1t1,d1t2,d1t3),
       o3(d3,d2t1,d2t2);
    
    d_ff d1(T[0],d1,clk);
    d_ff d2(T[1],d2,clk);
    d_ff d3(T[1],d3,clk);
endmodule

module tff(q,in,clk,clear);
    input in,clk,clear;
    output reg q;

    always@(posedge clk) begin
        if(!clear) begin
            q<=0;
        end
        else begin
            if(in)
                q<=(~q);
        end
    end
endmodule

module counter_4bit(count,clear,clk,en);
    input clear,clk,en;
    output  [3:0] count;

    wire in3,in4,clk_gate;

    assign in3=(count[0]&count[1]);
    assign in4=(count[0]&count[1]&count[2]);
    assign clk_gate=(clk&en);
         

    tff t1(count[0],1'b1,clk_gate,clear);
    tff t2(count[1],count[0],clk_gate,clear);
    tff t3(count[2],in3,clk_gate,clear);
    tff t4(count[3],in4,clk_gate,clear);
endmodule

module intg(count,g,S,X,clk);
    input S,X,clk;
    output [3:0] count;
    output g;

    wire clear,en;
    wire Z,z_not,t1,t2,final;
    wire [2:0] T;

    not n1(z_not,Z);

    and a1(t1,T[1],X),
        a2(t2,T[2],X,z_not),
        a3(clear,T[0],S),
        a4(Z,count[0],count[1],count[2],count[3]),
        a5(final,T[2],Z);
    or o1(en,t1,t1);

    counter_4bit xx1(count,clear,clk,en);
    ControlLogic xx2(T,X,Z,S,clk);
    d_ff xx3(g,final,clk);
endmodule

module testbench;
    reg S,X,clk;
    wire g;
    wire [3:0] count;

    intg func(count,g,S,X,clk);


    always
        #0.5 clk=~clk;
    //always@(posedge clk)
    //    $display(" posedge");

    initial 
        $monitor($time," count=%b g=%b",count,g);
    initial begin 
        #0 S=1;
        #0 X=1;
        #0 clk=0;
        #50 $finish;
    end
endmodule