`include "defs.sv"

module barrel_shifter_tb;
  
  logic [`SIZE-1:0] in;
  logic [1:0] no_of_bits;
  logic [`SIZE-1:0] out;
  
  barrel_shifter #(`SIZE,`MODE) dut(.*);
  
  task shift(bit [1:0] shift_bits=0);
    in=$urandom_range(1,((2**`SIZE))-1);
    no_of_bits=shift_bits;
  endtask

  initial 
    begin 
	//shift_chk
      #10 shift(0);
      #10 shift(1);
      #10 shift(2);
      #10 shift(3);
      #10 shift(1);
      #10 shift(3);
    end 
  initial #`SIM_TIME $finish;
  	
  //eda_playground_dumps
  initial begin $dumpfile("dump.vcd"); $dumpvars; end 
endmodule 
    
      
