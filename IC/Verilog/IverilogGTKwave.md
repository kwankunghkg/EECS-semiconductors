BLOG_GitHub_IverilogGTKwave_20240114.txt  
  https://github.com/kwankunghkg/EECS-semiconductors/blob/main/IC/Verilog/IverilogGTKwave.md  
  
last update : 20240114_1703(UTC+8)  
prev update : 20240114_1700(UTC+8)  
  
--------------------------------------------------  
  
## WSL2+Iverilog+GTKwave  
  
  
  
----------------------------------------  
  
  
  
----  
  
sudo apt install gtkwave  
  
  
----  
  
linux iverilog install  
  https://steveicarus.github.io/iverilog/usage/installation.html  
% git config --global user.name "Your Name Goes Here"  
% git config --global user.email you@yourpublicemail.example.com  
% git clone https://github.com/steveicarus/iverilog.git  
  
  
----  
  
install bison, flex, g++ and gcc  
  
% ./configure  
% make  
(su to root)  
% sudo make install  
  
  
----  
  
autoconf complains "C compiler cannot create executables" on Linux Mint  
  https://stackoverflow.com/questions/20678016/autoconf-complains-c-compiler-cannot-create-executables-on-linux-mint  
  
  
  
----  
  
vi hello.v  
  
module hello;  
  initial  
    begin  
      $display("Hello, World");  
      $finish ;  
    end  
endmodule  
  
  
iverilog -o hello hello.v  
vvp hello  
  
  
  
----  
  
  https://physerver.hamilton.edu/people/bcollett/Verilog1.html  
  
counter.v  
    
module counter(out, clk, reset);  
  
parameter WIDTH = 8;  
  
output [WIDTH-1 : 0] out;  
input clk, reset;  
  
reg [WIDTH-1 : 0]   out;  
wire clk, reset;  
  
always @(posedge clk)  
   out <= out + 1;  
  
always @reset  
   if (reset)  
      assign out = 0;  
   else  
      deassign out;  
  
endmodule // counter  
  
  
----  
  
Generate .vcd File for Verilog w/ GTKwave  
  https://www.physicsforums.com/threads/generate-vcd-file-for-verilog-w-gtkwave.447739/#google_vignette  
  
  
----  
  
test.v  
  
module test;  
  
/* Make a reset that pulses once. */  
reg reset = 0;  
initial begin  
$dumpfile("test.vcd");  
$dumpvars(0,test);  
  
```  
# 17 reset = 1;  
# 11 reset = 0;  
# 29 reset = 1;  
# 5 reset =0;  
# 513 $finish;  
end  
```  
  
/* Make a regular pulsing clock. */  
reg clk = 0;  
always #1 clk = !clk;  
  
wire [7:0] value;  
counter c1 (value, clk, reset);  
  
initial  
$monitor("At time %t, value = %h (%0d)",  
$time, value, value);  
endmodule // test  
   
  
  
  
----  
  
  
  
----  
  
  
  
----  
  
  
  
----  
End of File.  
