module ripple(count,clk,reset);

input clk,reset;
output [3:0]count;
wire [3:0]count_bar;

d_ff mod1(count[0], count_bar[0], count_bar[0], clk, reset);
d_ff mod2(count[1], count_bar[1], count_bar[1], count_bar[0], reset);
d_ff mod3(count[2], count_bar[2], count_bar[2], count_bar[1], reset);
d_ff mod4(count[3], count_bar[3], count_bar[3], count_bar[2], reset);
endmodule