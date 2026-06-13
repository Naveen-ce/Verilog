module traffic_light_ct #(parameter N=5)
                         
  (input clk,rst,
   output reg [N-1:0] NS1,NS2,EW1,EW2,
   output reg [$clog2(N)-2:0] NS1_P,NS2_P,NS3_P,NS4_P,EW1_P,EW2_P,EW3_P,EW4_P);
                         
   integer timer;
                         localparam s0=4'b0000,
                                    s1=4'b0001,
                                    s2=4'b0010,
                                    s3=4'b0011,
                                    s4=4'b0100,
                                    s5=4'b0101,
                                    s6=4'b0110,
                                    s7=4'b0111;
                         
                         reg[N-1:0] state,next_state;
                         
                         always@(posedge clk or posedge rst) 
                         begin
                           
                           if(rst) begin
                             state<=s0;
                             timer<=0;
                           end
                           
                           else if (timer==5) begin
                             state<=next_state;
                             timer<=0;
                           end
                           else
                             timer<=timer+1;
                           
                         end
                         
                         
                         always@(*) begin
                           
                           case(state)
                             
                             s0:next_state=s1;
                             s1:next_state=s2;
                             s2:next_state=s3;
                             s3:next_state=s4;
                             s4:next_state=s5;
                             s5:next_state=s6;
                             s6:next_state=s7;
                             s7:next_state=s0;
                             
                             default:next_state=s0;
                             
                           endcase
                         end
                         
                         always@(posedge clk or posedge rst) begin
                           
                           if(rst) begin
                              $display("");
                             $display("#----> All signals are Red <----#");
                             
                             NS1<=5'b10000;//Red
                             NS2<=5'b10000;//Red
                             EW1<=5'b10000;//Red
                             EW2<=5'b10000;//Red
                             NS1_P<=2'b10;//Red
                             NS2_P<=2'b10;//Red
                             NS3_P<=2'b10;//Red
                             NS4_P<=2'b10;//Red
                             EW1_P<=2'b10;//Red
                             EW2_P<=2'b10;//Red
                             EW3_P<=2'b10;//Red
                             EW4_P<=2'b10;//Red
                              $display("");
                           end
                           
                           else begin
                             
                             case(state)
                               
                               s0:begin //South to North
                                  $display("");
                                 $display("#----> SOUTH TO NORTH <-----#"); 
                                 
                                 
                                 //North South
                                  NS1<=5'b00111;//Green and Go to east and go to west
                                  NS2<=5'b10000;//Red
                                 
                                 //East West
                                  EW1<=5'b10000;//Red
                                  EW2<=5'b10010;//Red and Go to south
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b01;//Green
                                  NS3_P<=2'b10;//Red
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b01;//Green
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b10;//Red
                                 $display("");
                                 
                               end
                               
                               s1: begin // South to North
                                  $display("");
                                 $display("#----> SOUTH TO NORTH <-----#"); 
                                 
                                 
                                 //North South
                                  NS1<=5'b01000;//Yellow 
                                  NS2<=5'b10000;//Red
                                 
                                 //East West
                                  EW1<=5'b10000;//Red
                                  EW2<=5'b10010;//Red and Go to south
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b01;//Green
                                  NS3_P<=2'b10;//Red
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b01;//Green
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b10;//Red
                                  $display("");
                               end
                               
                               
                               s2:begin //North to South
                                  $display("");
                                 $display("#----> NORTH TO SOUTH <----#"); 
                                 
                                   //North South
                                  NS1<=5'b10000;//Red
                                  NS2<=5'b00111;//Green and Go to East and Go to West
                                 
                                 //East West
                                  EW1<=5'b10010;//Red and Go to North
                                  EW2<=5'b10000;//Red 
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b10;//Red
                                  NS3_P<=2'b01;//Green
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P=2'b10;//Red
                                  EW2_P=2'b10;//Red
                                  EW3_P=2'b10;//Red
                                  EW4_P=2'b01;//Green
                                  $display("");
                                 
                               end
                               
                               
                               s3: begin // North to south
                                  $display("");
                                 $display("#----> NORTH TO SOUTH <----#"); 
                                 
                                   //North South
                                  NS1<=5'b10000;//Red
                                  NS2<=5'b01000;//Yellow
                                 
                                 //East West
                                  EW1<=5'b10010;//Red and Go to North
                                  EW2<=5'b10000;//Red 
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b10;//Red
                                  NS3_P<=2'b01;//Green
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b10;//Red
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b01;//Green
                                  $display("");
                                 
                               end
                               
                               s4:begin //West to East
                                  $display("");
                                 $display("#----> West to East <----#");
                                 
                                  //North South
                                  NS1<=5'b10010;//Red and Go to west
                                  NS2<=5'b10000;//Red
                                 
                                 //East West
                                  EW1<=5'b00111;//Green and Go to North and Go to South
                                  EW2<=5'b10000;//Red 
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b01;//Green
                                  NS3_P<=2'b10;//Red
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b10;//Red
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b01;//Green
                                  $display("");
                                 
                               end
                               
                               
                               s5:begin //West to East
                                  $display("");
                                 $display("#----> West to East <----#");
                                 
                                  //North South
                                  NS1<=5'b10010;//Red and Go to west
                                  NS2<=5'b10000;//Red
                                 
                                 //East West
                                  EW1<=5'b01000;//Yellow
                                  EW2<=5'b10000;//Red 
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b01;//Green
                                  NS3_P<=2'b10;//Red
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b10;//Red
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b01;//Green
                                  $display("");
                                 
                               end
                               
                               
                                s6:begin //East to West
                                   $display("");
                                  $display("#----> East to West <----#");
                                 
                                  //North South
                                  NS1<=5'b10000;//Red
                                  NS2<=5'b10010;//Red and Go to East
                                 
                                 //East West
                                  EW1<=5'b10000;//Red 
                                  EW2<=5'b00111;//Green and Go to south and Go to North
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b10;//Red
                                  NS3_P<=2'b01;//Green
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b01;//Green
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b10;//Red
                                   $display("");
                                 
                               end
                                 
                                 
                                s7:begin //East to West
                                   $display("");
                                  $display("#----> East to West <----#");
                                 
                                  //North South
                                  NS1<=5'b10000;//Red
                                  NS2<=5'b10010;//Red and Go to East
                                 
                                 //East West
                                  EW1<=5'b10000;//Red 
                                  EW2<=5'b01000;//Yellow
                                 
                                 // North South Pedestrian
                                 
                                  NS1_P<=2'b10;//Red
                                  NS2_P<=2'b10;//Red
                                  NS3_P<=2'b01;//Green
                                  NS4_P<=2'b10;//Red
                                 
                                 // East West Pedestrian
                                  EW1_P<=2'b10;//Red
                                  EW2_P<=2'b01;//Green
                                  EW3_P<=2'b10;//Red
                                  EW4_P<=2'b10;//Red
                                   $display("");
                                 
                               end
                               
                               default: begin
                                 
                                 NS1<=4'b1000;//Red
                                 NS2<=4'b1000;//Red
                                 EW1<=4'b1000;//Red
                                 EW2<=4'b1000;//Red
                                 NS1_P<=2'b10;//Red
                                 NS2_P<=2'b10;//Red
                                 NS3_P<=2'b10;//Red
                                 NS4_P<=2'b10;//Red
                                 EW1_P<=2'b10;//Red
                                 EW2_P<=2'b10;//Red
                                 EW3_P<=2'b10;//Red
                                 EW4_P<=2'b10;//Red
                             
                               end
                               
                             endcase
                             
                           end
                         end
                         
                         endmodule
                                 
                                 
                        
                             
                         
                         
                         
                         
   
      
                         
                         
   
