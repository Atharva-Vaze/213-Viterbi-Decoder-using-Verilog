

module ACSU(acs0_pm_out, acs1_pm_out, acs2_pm_out, acs3_pm_out, 

                 acs4_pm_out, acs5_pm_out, acs6_pm_out, acs7_pm_out,



                 acs0_label,  acs1_label,  acs2_label,  acs3_label, 

                 acs4_label,  acs5_label,  acs6_label,  acs7_label,



                 acs0_pm_ina,  acs0_pm_inb, HD0_ina, HD0_inb,

                 acs1_pm_ina,  acs1_pm_inb, HD1_ina, HD1_inb,

                 acs2_pm_ina,  acs2_pm_inb, HD2_ina, HD2_inb,

                 acs3_pm_ina,  acs3_pm_inb, HD3_ina, HD3_inb,

                 acs4_pm_ina,  acs4_pm_inb, HD4_ina, HD4_inb,

                 acs5_pm_ina,  acs5_pm_inb, HD5_ina, HD5_inb,

                 acs6_pm_ina,  acs6_pm_inb, HD6_ina, HD6_inb,

                 acs7_pm_ina,  acs7_pm_inb, HD7_ina, HD7_inb,

                 aen, clock, reset

                );









   output [3:0] acs0_pm_out;

   output [3:0] acs1_pm_out;

   output [3:0] acs2_pm_out;

   output [3:0] acs3_pm_out;

   output [3:0] acs4_pm_out;

   output [3:0] acs5_pm_out;

   output [3:0] acs6_pm_out;

   output [3:0] acs7_pm_out;



   output  acs0_label;

   output  acs1_label;

   output  acs2_label;

   output  acs3_label;

   output  acs4_label;

   output  acs5_label;

   output  acs6_label;

   output  acs7_label;







   input [3:0]  acs0_pm_ina;

   input [3:0]  acs1_pm_ina;

   input [3:0]  acs2_pm_ina;

   input [3:0]  acs3_pm_ina;

   input [3:0]  acs4_pm_ina;

   input [3:0]  acs5_pm_ina;

   input [3:0]  acs6_pm_ina;

   input [3:0]  acs7_pm_ina;

   

   input [3:0]  acs0_pm_inb;

   input [3:0]  acs1_pm_inb;

   input [3:0]  acs2_pm_inb;

   input [3:0]  acs3_pm_inb;

   input [3:0]  acs4_pm_inb;

   input [3:0]  acs5_pm_inb;

   input [3:0]  acs6_pm_inb;

   input [3:0]  acs7_pm_inb;





   input [1:0] 	   HD0_ina;

   input [1:0] 	   HD1_ina;

   input [1:0] 	   HD2_ina;

   input [1:0] 	   HD3_ina;

   input [1:0] 	   HD4_ina;

   input [1:0] 	   HD5_ina;

   input [1:0] 	   HD6_ina;

   input [1:0] 	   HD7_ina;

   

   input [1:0] 	   HD0_inb;

   input [1:0] 	   HD1_inb;

   input [1:0] 	   HD2_inb;

   input [1:0] 	   HD3_inb;

   input [1:0] 	   HD4_inb;

   input [1:0] 	   HD5_inb;

   input [1:0] 	   HD6_inb;

   input [1:0] 	   HD7_inb;   

   

   input aen;

   input clock;

   input reset;





Add_Compare DUT0 (.acs_pm_survivor(acs0_pm_out), 

               .acs_label(acs0_label),

               

               .acs_pm_ina(acs0_pm_ina), 

               .HD_ina(HD0_ina), 

               

               .acs_pm_inb(acs0_pm_inb), 

               .HD_inb(HD0_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );



Add_Compare DUT1 (.acs_pm_survivor(acs1_pm_out),

               .acs_label(acs1_label), 

               

               .acs_pm_ina(acs1_pm_ina), 

               .HD_ina(HD1_ina), 

               

               .acs_pm_inb(acs1_pm_inb), 

               .HD_inb(HD1_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );





Add_Compare DUT2 (.acs_pm_survivor(acs2_pm_out), 

               .acs_label(acs2_label),

                

               .acs_pm_ina(acs2_pm_ina), 

               .HD_ina(HD2_ina),

                

               .acs_pm_inb(acs2_pm_inb), 

               .HD_inb(HD2_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );





Add_Compare DUT3 (.acs_pm_survivor(acs3_pm_out), 

               .acs_label(acs3_label),

                

               .acs_pm_ina(acs3_pm_ina), 

               .HD_ina(HD3_ina),

                

               .acs_pm_inb(acs3_pm_inb), 

               .HD_inb(HD3_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );







Add_Compare DUT4 (.acs_pm_survivor(acs4_pm_out), 

               .acs_label(acs4_label),

                

               .acs_pm_ina(acs4_pm_ina), 

               .HD_ina(HD4_ina),

                

               .acs_pm_inb(acs4_pm_inb), 

               .HD_inb(HD4_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );







Add_Compare DUT5 (.acs_pm_survivor(acs5_pm_out), 

               .acs_label(acs5_label),

                

               .acs_pm_ina(acs5_pm_ina), 

               .HD_ina(HD5_ina),

                

               .acs_pm_inb(acs5_pm_inb), 

               .HD_inb(HD5_inb),               



               .aen(aen),

               .clock(clock),

               .reset(reset)

               );



Add_Compare DUT6 (.acs_pm_survivor(acs6_pm_out), 

               .acs_label(acs6_label),

                

               .acs_pm_ina(acs6_pm_ina), 

               .HD_ina(HD6_ina),

                

               .acs_pm_inb(acs6_pm_inb), 

               .HD_inb(HD6_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );





Add_Compare DUT7 (.acs_pm_survivor(acs7_pm_out), 

               .acs_label(acs7_label),

                

               .acs_pm_ina(acs7_pm_ina), 

               .HD_ina(HD7_ina),

                

               .acs_pm_inb(acs7_pm_inb), 

               .HD_inb(HD7_inb),



               .aen(aen),

               .clock(clock),

               .reset(reset)

              );





endmodule 