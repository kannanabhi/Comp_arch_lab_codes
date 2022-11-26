module alu(result,carryout,a,b,binvert,carryin,operation);
    input [31:0]a,b;
    input binvert,carryin;
    input [1:0] operation;

    output carryout;
    output [31:0]result;

    wire [31:0] Not_b,Wand,Wor,Wmux,Wadd;
    bit32not bnot(Not_b,b);
    bit32and band(Wand,a,b);
    bit32or bor(Wor,a,b);
    bit32_2to1mux mux1(Wmux,binvert,b,Not_b);
    bit32_fadder fadd(Wadd,carryout,binvert,a,Wmux);
    bit32_4to1mux mux2(result,Wand,Wor,Wadd,32'h00000000,operation);
endmodule