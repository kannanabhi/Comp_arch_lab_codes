module tb_mealy;
reg clk, rst, inp;
wire outp;
reg[15:0] sequence;
integer i;
mealy duty( outp,clk, rst, inp);
initial
begin
clk = 0;
rst = 1;
sequence = 16'b0101_0111_0111_0010;
#5 rst = 0;
for( i = 0; i <= 15; i = i + 1)
begin
inp = sequence[i];
#2 clk = 1;
#2 clk = 0;
$display("State = ", duty.state, " Input = ", inp, ", Output = ", 
outp);
end
testing;
end
task testing;
for( i = 0; i <= 15; i = i + 1)
begin
inp = $random % 2;
#2 clk = 1;
#2 clk = 0;
$display("State = ", duty.state, " Input = ", inp, ", Output = ", outp);
end
endtask
endmodule