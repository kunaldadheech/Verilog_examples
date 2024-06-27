module barrel_shifter #(parameter SIZE =4,MODE=1)(
  input [SIZE-1:0]in,		//input_of_shifter
  input [1:0] no_of_bits,	//how_many_bits_should_be_shifted
  output [SIZE-1:0]out); 	//output

  
  generate 
    if(!MODE)
      begin:left_shift_config 
        mux4_1 mux0(.a(in[0]),.b(in[3]),.c(in[2]),.d(in[1]),.sel(no_of_bits),.out(out[0]));
        mux4_1 mux1(.a(in[1]),.b(in[0]),.c(in[3]),.d(in[2]),.sel(no_of_bits),.out(out[1]));
        mux4_1 mux2(.a(in[2]),.b(in[1]),.c(in[0]),.d(in[3]),.sel(no_of_bits),.out(out[2]));
        mux4_1 mux3(.a(in[3]),.b(in[2]),.c(in[1]),.d(in[0]),.sel(no_of_bits),.out(out[3]));
      end 
    else 
      begin:right_shift_config
        mux4_1 mux0(.a(in[0]),.b(in[1]),.c(in[2]),.d(in[3]),.sel(no_of_bits),.out(out[0]));
        mux4_1 mux1(.a(in[1]),.b(in[2]),.c(in[3]),.d(in[0]),.sel(no_of_bits),.out(out[1]));
        mux4_1 mux2(.a(in[2]),.b(in[3]),.c(in[0]),.d(in[1]),.sel(no_of_bits),.out(out[2]));
        mux4_1 mux3(.a(in[3]),.b(in[0]),.c(in[1]),.d(in[2]),.sel(no_of_bits),.out(out[3]));
      end 
  endgenerate 

endmodule 

//4x1_mux 
module mux4_1(
  input a,b,c,d, 
  input [1:0]sel,
  output reg out);

  always@(*)
    case(sel)
      2'b00		: out=a;
      2'b01		: out=b;
      2'b10		: out=c;
      2'b11		: out=d;
      default	: out=a; 
    endcase 
endmodule 

