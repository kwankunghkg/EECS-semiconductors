module test;

/* Make a reset that pulses once. */
reg reset = 0;
initial begin
  $dumpfile("test.vcd");
  $dumpvars(0,test);
  # 17 reset = 1;  
  # 11 reset = 0;  
  # 29 reset = 1;  
  # 5 reset =0;  
  # 513 $finish;  
  end  

/* Make a regular pulsing clock. */
reg clock = 0;
always #1 clock = !clock;

wire [7:0] value;  / declare probes for $monitor

counter c1 (value, clock, reset);  // instantiate DeviceUnderTest

initial $monitor("At time %t, value = %h (%0d)", $time, value, value);

endmodule // test
