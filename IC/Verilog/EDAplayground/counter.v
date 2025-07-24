module counter(out, clk, reset);

parameter WIDTH = 8;

output [WIDTH-1 : 0] out;
input clock, reset;

reg [WIDTH-1 : 0] out;
wire clock, reset;

always @(posedge clock)
  out <= out + 1;

always @reset
  if (reset)
    assign out = 0;
  else
    deassign out;

endmodule // counter
