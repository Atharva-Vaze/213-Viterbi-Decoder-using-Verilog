



module controlpath (Dx,  oen,  len, aen, 

                     A0_out, A1_out, A2_out, A3_out, A4_out, A5_out, A6_out, A7_out,

                     A0_in,  A1_in,  A2_in,  A3_in,  A4_in,  A5_in,  A6_in,  A7_in,

                     acs0_label,  acs1_label,  acs2_label,  acs3_label,  acs4_label,  acs5_label,  acs6_label,  acs7_label,

                     seqrdy, reset, clock 

                    );



   output  Dx;

   output           oen;

   output           len;

   output          aen;

      

   output [3:0] A0_out;

   output [3:0] A1_out;

   output [3:0] A2_out;

   output [3:0] A3_out;

   output [3:0] A4_out;

   output [3:0] A5_out;

   output [3:0] A6_out;

   output [3:0] A7_out;



   

   input [3:0] A0_in;

   input [3:0] A1_in;

   input [3:0] A2_in;

   input [3:0] A3_in;

   input [3:0] A4_in;

   input [3:0] A5_in;

   input [3:0] A6_in;

   input [3:0] A7_in;

   

		   

   input   acs0_label;

   input   acs1_label;

   input   acs2_label;

   input   acs3_label;

   input   acs4_label;

   input   acs5_label;

   input   acs6_label;

   input   acs7_label;

   

		   

   input 	  seqrdy;

   input 	  reset;

   input 	  clock;

   

   reg [14:0]   P0;

   reg [14:0]   P1;

   reg [14:0]   P2;

   reg [14:0]   P3;

   reg [14:0]   P4;

   reg [14:0]   P5;

   reg [14:0]   P6;

   reg [14:0]   P7;



   

   reg [3:0]   A0;

   reg [3:0]   A1;

   reg [3:0]   A2;

   reg [3:0]   A3;

   reg [3:0]   A4;

   reg [3:0]   A5;

   reg [3:0]   A6;

   reg [3:0]   A7;

   

   

   reg [8:0] 	  symbol;

   reg [3:0] 	  write_ptr;

   reg [3:0] 	  trace_ptr;

   reg [2:0] 	  tb_reg;

   

   

   reg 		   len;

   reg 		  aen;

   reg 		  wen;

   reg 		  ten;

   reg 		   oen;

   

   



  



   parameter [6:0] 

                   RESET           =7'b0000001,

                   calc_HD         =7'b0000010,

                   add_HD          =7'b0000100,

                   write_state     =7'b0001000,

                   beststate       =7'b0010000,

                   traceback       =7'b0100000,

						 output_DX       =7'b1000000;

   



   reg [6:0] next_state;



   wire [2:0] min_state;

  

   

   

   Decision UUT_TB (.bstate(min_state), 

                         .in0(A0_out), .in1(A1_out), .in2(A2_out), .in3(A3_out), 

                         .in4(A4_out), .in5(A5_out), .in6(A6_out), .in7(A7_out));

   

   

   

   

   assign Dx = ( oen) ? tb_reg[0] : 1'bz;

   

   assign A0_out = (write_ptr>0) ? A0_in:A0;

   assign A1_out = (write_ptr>0) ? A1_in:A1;

   assign A2_out = (write_ptr>0) ? A2_in:A2;

   assign A3_out = (write_ptr>0) ? A3_in:A3;

   assign A4_out = (write_ptr>0) ? A4_in:A4;

   assign A5_out = (write_ptr>0) ? A5_in:A5;

   assign A6_out = (write_ptr>0) ? A6_in:A6;

   assign A7_out = (write_ptr>0) ? A7_in:A7;



   

   always @(posedge clock or posedge reset)

     begin

	if (reset)

	  begin

	     P0 <=0; P1 <=0; P2 <=0; P3 <=0; P4 <=0; P5 <=0; P6 <=0; P7 <=0;

	  end

	else

	  begin

             if (wen && write_ptr>0)

               begin

                  P0   <={acs0_label, P0[14:1]};									//acs0_label is written as P0_label in documentation

                  P1   <={acs1_label, P1[14:1]};									//Similarly for all

                  P2   <={acs2_label, P2[14:1]};

                  P3   <={acs3_label, P3[14:1]};

                  P4   <={acs4_label, P4[14:1]};

                  P5   <={acs5_label, P5[14:1]};

                  P6   <={acs6_label, P6[14:1]};

                  P7   <={acs7_label, P7[14:1]};		  

               end	  

      end

	  end

        

   always @(posedge clock or posedge reset)

     begin

	if (reset)

	  begin

	     A0 <=0;       A1 <=4'b1111; A2 <=4'b1111; A3 <=4'b1111; 

             A4 <=4'b1111; A5 <=4'b1111; A6 <=4'b1111; A7 <=4'b1111;

	  end

	else

	  begin

             if (wen)

               begin

                  A0 <=A0_in; A1 <=A1_in; A2 <=A2_in; A3 <=A3_in; 

                  A4 <=A4_in; A5 <=A5_in; A6 <=A6_in; A7 <=A7_in;

               end

	  end

     end



   always @(posedge clock or posedge reset)

     begin

	if (reset)

	  tb_reg <=0;

	else

	  begin

	     if (next_state==write_state)

	        tb_reg <=min_state;

	     else if (ten)

               begin

                  case (tb_reg)

                    3'b000 : tb_reg <={P0[trace_ptr],tb_reg[2:1]};

                    3'b001 : tb_reg <={P1[trace_ptr],tb_reg[2:1]};

                    3'b010 : tb_reg <={P2[trace_ptr],tb_reg[2:1]};

                    3'b011 : tb_reg <={P3[trace_ptr],tb_reg[2:1]};

                    3'b100 : tb_reg <={P4[trace_ptr],tb_reg[2:1]};

                    3'b101 : tb_reg <={P5[trace_ptr],tb_reg[2:1]};

                    3'b110 : tb_reg <={P6[trace_ptr],tb_reg[2:1]};

                    3'b111 : tb_reg <={P7[trace_ptr],tb_reg[2:1]};

                  endcase

	       end

	  end

     end



   //FSM

   always @ (posedge clock or posedge reset)

     begin

        if (reset)

          begin

              len <=0; aen <=0; wen <=0; ten <=0;  oen <=0;

	     write_ptr    <=0;

	     trace_ptr    <=0;

	     symbol <=0;

             next_state   <= RESET;

          end

        else

          begin

             case(next_state) //synopsys full_case parallel_case







               RESET:      begin

		             if (seqrdy)

			       begin

                                   len <=0; aen <=0; wen <=0; ten <=0;  oen <=0;

                                  next_state <=calc_HD;

			       end

		             else

			       next_state <=RESET;

                           end // case: RESET





               

               calc_HD:    begin

                               len <=1; aen <=0; wen <=0; ten <=0;  oen <=0;

                              next_state   <= add_HD;

                           end 







               

               add_HD:        begin

                               len <=0; aen <=1; wen <=0; ten <=0;  oen <=0;

                              next_state   <= write_state;

                           end 





	       

               write_state: begin



                                 if (write_ptr < 14)

                                   begin

                                       len <=0; aen <=0; wen <=1; ten <=0;  oen <=0;

				      write_ptr <=write_ptr+1;

                                      next_state   <= calc_HD;

                                   end

                                else if (write_ptr == 14)

                                   begin

				       len <=0; aen <=0; wen <=1; ten <=0;  oen <=0;

				      write_ptr <=write_ptr+1;

                                      next_state   <= beststate;

			           end

                              end // case: write_state







               

               beststate:    begin

                                  len <=0; aen <=0; wen <=0; ten <=0;  oen <=0;

		                 ;

		                 write_ptr    <=14;

		  		 trace_ptr    <=14;

                                 next_state   <= traceback;

                              end 



	       

               traceback:     begin

                                 if (trace_ptr >1)

                                   begin

                                       len <=0; aen <=0; wen <=0; ten <=1;  oen <=0;

		                      trace_ptr    <=trace_ptr-1; 

                                      next_state   <= traceback;

                                   end	    

                                 else if (trace_ptr == 1) 

                                   begin

                                       len <=0; aen <=0; wen <=0; ten <=0;  oen <=0;

                                      next_state   <= output_DX;

	                           end

                              end 



               output_DX:     begin

                                 if (symbol <=18)

                                   begin

                                       len <=0; aen <=0; wen <=0; ten <=0;  oen <=1;

	                              symbol <=symbol+1;				   

                                      next_state   <= calc_HD;

				   end

	                         else if (symbol <23)

				   begin

				       len <=0; aen <=0; wen <=0; ten <=0;  oen <=1;

                                      symbol  <=symbol+1;

                                      next_state   <= beststate;

				   end

		                 else

				   begin

				       len <=0; aen <=0; wen <=0; ten <=0;  oen <=0;

                                      next_state   <= RESET;

				   end

                end 

	    endcase 

	 end 

   end 

   



endmodule