module alu(result,carryout,a,b,binvert,carryin,operation);
    input [31:0]a,b;
    input binvert,carryin;
    input [1:0] operation;

    output carryout;
    output [31:0]result;

    wire [31:0]not_b,bout;

    case(operation)

    2'b00: begin
        //and operation
        bit32and badd(result,a,b);
          end
    2'b01: begin
        //or operation
        bit32or bor(result,a,b);
        end
    
    2'b10: begin
        //add and subtract operation
        bit32not bnot(not_b,b);
        bit32_2to1mux(bout,binvert,b,not_b);
        if(binvert)
            assign carryin=1'b1;
        bit32_fadder(result,carryout,carryin,a,bout);
        end
    default: begin
        $display("incorrect operation code");
        end
    endcase

endmodule