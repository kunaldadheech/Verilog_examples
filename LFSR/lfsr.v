module lfsr #(parameter SIZE=8)(
  input clk,rst_n,
  input [SIZE-1:0]seed,
  input seed_in,
  output reg [SIZE-1:0]out);
  
  wire fback;
  
  assign fback = out[1] ^ out[0];
  
  //main_operation:
  always@(posedge clk)
    if(!rst_n)
      begin 
        out <='1;
      end 
  
    else if(seed_in)
      out<=seed;
  
  	else 
      begin 
        //first_shift_then
        //assign_to_msb
        out <=out>>1;
        out[SIZE-1]<=fback;
      end 
  
endmodule 
  
        
