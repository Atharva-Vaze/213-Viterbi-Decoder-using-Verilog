`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:56 04/23/2020 
// Design Name: 
// Module Name:    Testbench 
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
/////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ns


module testbench;


   reg [1:0] Rx_data [0:22];

   reg [1:0] 	Rx;
   reg         seqrdy;
   reg 			clock;
   reg 			reset;

   wire 	Dx;
   wire [63:0] 	HD;
   wire 		oe;
   integer 		i;
   
   
Viterbi TB_U2(.Dx(Dx), .oen(oen), .Rx(Rx), .seqrdy(seqrdy), .clock(clock), .reset(reset));



always
  begin
     #20;
     clock=~clock;
  end


initial
  begin
     Rx_data[0]  = 2'b00;
     Rx_data[1]  = 2'b11;
     Rx_data[2]  = 2'b10;
     Rx_data[3]  = 2'b10;
     Rx_data[4]  = 2'b11;
     Rx_data[5]  = 2'b01;
     Rx_data[6]  = 2'b10;
     Rx_data[7]  = 2'b00;
     Rx_data[8]  = 2'b00;
     Rx_data[9]  = 2'b01;
     Rx_data[10] = 2'b00;
     Rx_data[11] = 2'b10;
     Rx_data[12] = 2'b11;
     Rx_data[13] = 2'b11;
     Rx_data[14] = 2'b11;
     Rx_data[15] = 2'b10;
     Rx_data[16] = 2'b10;
     Rx_data[17] = 2'b00;
     Rx_data[18] = 2'b00;
     Rx_data[19] = 2'b01;
     Rx_data[20] = 2'b11;
     Rx_data[21] = 2'b11;
     Rx_data[22] = 2'b00;
   end

initial
  begin
     clock    = 0;
     reset    = 1;            
     #40 reset =0; 

     seqrdy =1;

     for (i=0; i<15; i=i+1)
       begin
               Rx=Rx_data[i];
               #120;

        end

    
     for (i=15; i<33; i=i+1)
       begin
               Rx=Rx_data[i];
               #760;

        end

     seqrdy =0;
     
  end
   
   

initial
   #17000 $finish;


initial
   $monitor("time=%4g, clock=%b, Rx=%b, wen=%b, ten=%b, oen=%b, write_ptr=%h, trace_ptr=%h, min_state=%b, tb_reg=%b,A_in=%h,P_in=%b,plabels=%b,Dx=%b, ns=%b",
             $time,
             clock,
	     Rx,
	     TB_U2.U3.wen,
	     TB_U2.U3.ten,
	     TB_U2.U3.oen,	    
	     TB_U2.U3.write_ptr,
    	     TB_U2.U3.trace_ptr,
             TB_U2.U3.min_state,
	    
             TB_U2.U3.tb_reg,

            {TB_U2.U3.A0_in, 
             TB_U2.U3.A1_in,
             TB_U2.U3.A2_in,
             TB_U2.U3.A3_in,
             TB_U2.U3.A4_in,
             TB_U2.U3.A5_in,
             TB_U2.U3.A6_in,
             TB_U2.U3.A7_in},
	     	     
             {TB_U2.U3.acs0_label, 
             TB_U2.U3.acs1_label,
             TB_U2.U3.acs2_label,
             TB_U2.U3.acs3_label,
             TB_U2.U3.acs4_label,
             TB_U2.U3.acs5_label,
             TB_U2.U3.acs6_label,
             TB_U2.U3.acs7_label},
	    

            {TB_U2.U3.P0[14], 
             TB_U2.U3.P1[14],
             TB_U2.U3.P2[14],
             TB_U2.U3.P3[14],
             TB_U2.U3.P4[14],
             TB_U2.U3.P5[14],
             TB_U2.U3.P6[14],
             TB_U2.U3.P7[14]},
	    
             TB_U2.U3.Dx,
	     TB_U2.U3.next_state
             );


endmodule





