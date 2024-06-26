`define RST_HOLD 	2	//macro_to_make_the_rst_low_for_no_of_cycles
`define SIZE 		8	//width_of_the_ring_counter
`define SIM_TIME 	200 //time_at_which_simulation_ends

module ring_count_tb;
  
  logic 			rst_n;
  logic [`SIZE-1:0]	out;
  
  
  //clk_gen 
  bit clk;
  always 
    #5 clk=~clk;
  
  //dut_inst
  ring_count #(`SIZE) dut(.*);
  
  task rst_chk;
    @(negedge clk);
      rst_n=0;
      repeat(`RST_HOLD)
      	@(negedge clk);
      rst_n=1;
    
  endtask: rst_chk
    
  initial 
    begin 
      rst_chk;
    end 
  
  initial #`SIM_TIME $finish;
  
  //wave_dumps_for_eda_playground
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars;
    end 
  
endmodule 
    
      
