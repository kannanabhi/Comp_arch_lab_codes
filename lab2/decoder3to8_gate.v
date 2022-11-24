module decoder3to8_gate(out,x,y,z);
    input x,y,z;
    output [7:0]out;
    wire x1,y1,z1;

    not n1(x1,x);
    not n2(y1,y);
    not n3(z1,z);

    and a1(out[0],z1,x1,y1);
    and a2(out[1],z,x1,y1);
    and a3(out[2],z1,x1,y);
    and a4(out[3],z,x1,y);
    and a5(out[4],z1,x,y1);
    and a6(out[5],z,x,y1);
    and a7(out[6],z1,x,y);
    and a8(out[7],z,x,y);
endmodule