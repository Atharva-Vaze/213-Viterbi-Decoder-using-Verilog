`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:43:24 04/20/2020 
// Design Name: 
// Module Name:    Decision 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decision( bstate, in0, in1, in2, in3, in4 ,in5, in6, in7);

output [2:0] bstate;
input [3:0] in0;
input [3:0] in1;
input [3:0] in2;
input [3:0] in3;
input [3:0] in4;
input [3:0] in5;
input [3:0] in6;
input [3:0] in7;

reg [2:0] bstate;
reg [2:0] min01;
reg [2:0] min23;
reg [2:0] min45;
reg [2:0] min67;
reg [2:0] min0123;
reg [2:0] min4567;
reg [2:0] flag_metric; 

always@(in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7)
begin
if(in0<=in1)
min01=in0;
else
min01=in1;

if(in2<=in3)
min23=in2;
else
min23=in3;

if(in4<=in5)
min01=in4;
else
min45=in5;

if(in6<=in7)
min67=in6;
else
min67=in7;

if(min01<=min23)
min0123<=min01;
else
min0123<=min23;

if(min45<=min67)
min4567<=min45;
else
min4567<=min67;

if(min0123<=min4567)
flag_metric<=min0123;
else
flag_metric<=min4567;
end

always@(in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7)
begin
if(flag_metric==in0)
bstate=3'b000;

if(flag_metric==in1)
bstate=3'b001;

if(flag_metric==in2)
bstate=3'b010;

if(flag_metric==in3)
bstate=3'b011;

if(flag_metric==in4)
bstate=3'b100;

if(flag_metric==in5)
bstate=3'b101;


if(flag_metric==in6)
bstate=3'b110;


if(flag_metric==in7)
bstate=3'b111;

end
endmodule






