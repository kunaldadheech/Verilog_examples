module lfsr_tb;
  
  bit clk;
  logic rst_n;
  logic [7:0]seed;
  logic seed_in;
  
  logic [7:0]out;
  
  //module_inst
  lfsr dut(.*);
  
  //clk_gen
  always 
    #5 clk =~clk;
  
  task rst_chk;
    @(negedge clk);
      rst_n=0;
    @(negedge clk);
      rst_n=1;
    
  endtask:rst_chk
  
  task seed_chk(bit [7:0] seed_val);
    @(negedge clk);
    seed_in=1;
    seed=seed_val;
    @(negedge clk);
    seed_in=0;
    //waits_for_all_numbers
    $display("-------------SEED---------------");
    repeat(255)
      begin
        $display("seed val: %0d ",seed_val,"Out: %b",out);
      	@(negedge clk);
      end 
    $display("--------------------------------");

  endtask:seed_chk
    
  initial 
    begin 
      rst_chk();
      seed_chk($urandom_range(1,100));
      seed_chk($urandom_range(101,200));
      seed_chk($urandom_range(200,255));
      $finish;
    end 
  
  //signal_monitors
  initial 
    begin 
      //configuring "%t"
      $timeformat(-9,0,"ns",1);
    end 
  
  //wave_dump
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars;
    end 
  
endmodule 
      
      
