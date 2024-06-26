module ring_count #(parameter SIZE=8)(
  input clk,rst_n, 
  output reg [SIZE-1:0]out);

  always@(posedge clk)
    if(!rst_n)
      begin 
        out[SIZE-1]		<=1'b1;
        out[SIZE-2:0]	<=1'b0;
      end 
    else 
      if(!out[0])
        out<=(out>>1);
      else 
        begin 
          out[SIZE-1]	<=1'b1;
          out[SIZE-2:0]	<=1'b0;
        end 
endmodule
