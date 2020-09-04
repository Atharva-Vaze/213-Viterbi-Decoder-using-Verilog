`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:03:56 04/20/2020 
// Design Name: 
// Module Name:    Add_Compare 
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
module Add_Compare(acs_pm_survivor, acs_label, acs_pm_ina, HD_ina, acs_pm_inb, HD_inb, aen, clock, reset
    );
output [3:0] acs_pm_survivor;
output [3:0] acs_label;
input [3:0] acs_pm_ina;
input [3:0] acs_pm_inb;
input [1:0] HD_ina;
input [1:0] HD_inb;
input aen;
input clock;
input reset;

reg [3:0] acs_pm_survivor;
reg  acs_label; 
reg [3:0] suma;
reg [3:0] sumb;

always@(posedge clock or posedge reset)
begin
if(reset)
suma<=0;
else
begin
if(aen && acs_pm_ina== 4'b1111)
suma<=acs_pm_ina;
else if(aen)
suma<=acs_pm_ina + HD_ina;
end
end

always@(posedge clock or posedge reset)
begin
if(reset)
sumb<=0;
else if(aen && acs_pm_inb==4'b1111)
sumb<=acs_pm_inb + HD_inb;
else if(aen)
sumb<=acs_pm_inb+HD_inb;
end

always@(suma or sumb)
begin
if(suma<=sumb && aen)
begin
acs_pm_survivor=suma;
acs_label=1'b0;
end
else
begin
acs_pm_survivor=sumb;
acs_label=1'b1;
end
end
endmodule


