//FIFO_Depth-16
module fifo#(parameter WIDTH=8,DEPTH=16)(
  input rst_n,
  input [WIDTH-1:0]d_in,
  input wr_en, w_clk,
  input rd_en, rd_clk, 

  output reg [WIDTH-1:0]d_out,
  output full, empty);
  
  reg [$clog2(DEPTH)-1:0] rd_ptr;
  reg [$clog2(DEPTH)-1:0] wr_ptr;
  
  //memory
  reg [WIDTH-1:0] mem_block [DEPTH];
  
  //variable_for_loop
  integer i;
  
  
  //writign_process
  always@(posedge w_clk)
    begin 
      if(!rst_n)
        begin 
          for(i=0;i<DEPTH;i=i+1)
            mem_block[i]<='b0;
          wr_ptr<='b0;
        end 
      else
        if((wr_en) && (!full))
          begin 
            mem_block[wr_ptr]<=d_in;
            wr_ptr<=wr_ptr+1;
          end
      	else 
          begin 
            wr_ptr<=wr_ptr;
          end  
    end 
  
  //reading_process
  always@(posedge rd_clk)
    begin 
      if(!rst_n)
        rd_ptr<='b0;
      else
        if((rd_en) && (!empty))
          begin 
            d_out<=mem_block[rd_ptr];
            rd_ptr<=rd_ptr+1;
          end
        else 
          rd_ptr<=rd_ptr;
    end 
  
  //flags
  assign full  = (wr_ptr==rd_ptr-1)&&(rst_n);
  assign empty = (wr_ptr==rd_ptr)&&(rst_n);
  
endmodule