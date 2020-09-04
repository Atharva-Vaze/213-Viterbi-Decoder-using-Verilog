`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:02:55 04/20/2020 
// Design Name: 
// Module Name:    Viterbi 
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
module Viterbi(Dx, Rx, oen, clock, seqrdy,reset
    );
	 
output Dx;
output oen;
input [1:0] Rx;
input seqrdy;
input reset;
input clock;

wire[3:0] A0_out;
wire[3:0] A1_out;
wire[3:0] A2_out;
wire[3:0] A3_out;
wire[3:0] A4_out;
wire[3:0] A5_out;
wire[3:0] A6_out;
wire[3:0] A7_out;

 wire [3:0] acs0_pm_out;
 wire [3:0] acs1_pm_out;
 wire [3:0] acs2_pm_out;
 wire [3:0] acs3_pm_out;
 wire [3:0] acs4_pm_out;
 wire [3:0] acs5_pm_out;   
 wire [3:0] acs6_pm_out;   
 wire [3:0] acs7_pm_out;

wire acs1_label;
wire acs2_label;
wire acs3_label;
wire acs4_label;
wire acs5_label;
wire acs6_label;
wire acs7_label;

wire [1:0] HD1;	wire [1:0] HD9;
wire [1:0] HD2;	wire [1:0] HD10;
wire [1:0] HD3;   wire [1:0] HD11;
wire [1:0] HD4;	wire [1:0] HD12;
wire [1:0] HD5;	wire [1:0] HD13;
wire [1:0] HD6;	wire [1:0] HD14;
wire [1:0] HD7;	wire [1:0] HD15;
wire [1:0] HD8;	wire [1:0] HD16;

BMU U1(.HD1(HD1), .HD2(HD2), .HD3(HD3), .HD4(HD4), .HD5(HD5), .HD6(HD6), .HD7(HD7), .HD8(HD8), .HD9(HD9), .HD10(HD10), .HD11(HD11), .HD12(HD12), .HD13(HD13), .HD14(HD14), .HD15(HD15), .HD16(HD16), .Rx(Rx), .len(len), .clock(clock), .reset(reset)
);

ACSU U2(.acs0_pm_out(acs0_pm_out), .acs1_pm_out(acs1_pm_out), 
              .acs2_pm_out(acs2_pm_out), .acs3_pm_out(acs3_pm_out), 
              .acs4_pm_out(acs4_pm_out), .acs5_pm_out(acs5_pm_out), 
              .acs6_pm_out(acs6_pm_out), .acs7_pm_out(acs7_pm_out),

              .acs0_label(acs0_label),   .acs1_label(acs1_label), 
              .acs2_label(acs2_label),   .acs3_label(acs3_label), 
              .acs4_label(acs4_label),   .acs5_label(acs5_label), 
              .acs6_label(acs6_label),   .acs7_label(acs7_label),

              .acs0_pm_ina(A0_out),  .acs0_pm_inb(A4_out), .HD0_ina(HD1), .HD0_inb(HD9),
              .acs1_pm_ina(A0_out),  .acs1_pm_inb(A4_out), .HD1_ina(HD2), .HD1_inb(HD10),
              .acs2_pm_ina(A1_out),  .acs2_pm_inb(A5_out), .HD2_ina(HD3), .HD2_inb(HD11),
              .acs3_pm_ina(A1_out),  .acs3_pm_inb(A5_out), .HD3_ina(HD4), .HD3_inb(HD12),
              .acs4_pm_ina(A2_out),  .acs4_pm_inb(A6_out), .HD4_ina(HD5), .HD4_inb(HD13),
              .acs5_pm_ina(A2_out),  .acs5_pm_inb(A6_out), .HD5_ina(HD6), .HD5_inb(HD14),
              .acs6_pm_ina(A3_out),  .acs6_pm_inb(A7_out), .HD6_ina(HD7), .HD6_inb(HD15),
              .acs7_pm_ina(A3_out),  .acs7_pm_inb(A7_out), .HD7_ina(HD8), .HD7_inb(HD16),
	      .aen(aen), .reset(reset), .clock(clock)
              );
				  
				 controlpath U3(.Dx(Dx), .oen(oen), .len(len), .aen(aen), 
                 .A0_out(A0_out), .A1_out(A1_out), .A2_out(A2_out), .A3_out(A3_out), 
                 .A4_out(A4_out), .A5_out(A5_out), .A6_out(A6_out), .A7_out(A7_out),
                 
                 .A0_in(acs0_pm_out), .A1_in(acs1_pm_out), .A2_in(acs2_pm_out), .A3_in(acs3_pm_out),  
                 .A4_in(acs4_pm_out), .A5_in(acs5_pm_out), .A6_in(acs6_pm_out), .A7_in(acs7_pm_out),
                 
                 .acs0_label(acs0_label), .acs1_label(acs1_label), .acs2_label(acs2_label), .acs3_label(acs3_label), 
                 .acs4_label(acs4_label), .acs5_label(acs5_label), .acs6_label(acs6_label), .acs7_label(acs7_label),
                 .seqrdy(seqrdy), .reset(reset), .clock(clock)
                );

endmodule
