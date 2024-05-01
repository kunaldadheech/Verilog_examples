module edge_det (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    reg    rising_edge_o,//asserted_when_there_is_a_rising_edge_in_"a_i" 
  output    reg    falling_edge_o//asserted_when_there_is_a_falling_edge_in_"a_i"
);

  //rising_edge_logic
  always@(clk or  posedge a_i)
    if(reset)
      rising_edge<=1'b0;
    else
      begin 
        if(a_i)    
    	    rising_edge_o<=1'b1;
  	    else 
          rising_edge_o<=1'b0;
      end 
	
  //falling_edge_logic
  always@(clk or  negedge a_i)
    if(reset)
      rising_edge<=1'b0;
    else
      begin
        if(a_i)    
    	    falling_edge_o<=1'b1;
  	    else 
          falling_edge_o<=1'b0;
      end
endmodule

