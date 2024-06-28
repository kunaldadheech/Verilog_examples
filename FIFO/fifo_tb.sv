module fifo_tb;
  
  logic rst_n;
  bit clk;
  logic wr_en,rd_en;
  logic [7:0]d_in,d_out;
  logic full,empty;
  
  fifo #(.WIDTH(8),.DEPTH(16)) dut (.rst_n(rst_n),.d_in(d_in),.wr_en(wr_en),.w_clk(clk), 										.rd_en(rd_en),.rd_clk(clk),.d_out(d_out),.full(full),
                                    .empty(empty));
  
  always #5 clk=~clk;
  
  task rst_chk;
    @(negedge clk);
      rst_n=0;
      @(negedge clk);
      rst_n=1;
  endtask:rst_chk
  
  task wr_chk;
    @(negedge clk);
    wr_en=1;
    repeat(20) 
      begin 
    	d_in=$urandom;
        @(negedge clk);
      end 
    d_in='b0;
    wr_en=0;
  endtask:wr_chk
  
  task rd_chk;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    
    rd_en=1;
    repeat(2)
      begin 
    	d_in=$urandom;
        @(negedge clk);
      end 
    rd_en=0;
  endtask
  
  initial 
    begin 
      rst_chk;
      fork
        wr_chk;
        rd_chk;
      join
      #100;
      $finish;
    end 
  
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars;
    end 
  
endmodule
