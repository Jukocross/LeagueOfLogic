/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compareUnit_17 (
    input [0:0] z,
    input [0:0] v,
    input [0:0] n,
    input [5:0] alufn_signal,
    output reg [15:0] out
  );
  
  
  
  always @* begin
    
    case (alufn_signal[1+1-:2])
      2'h1: begin
        out = 16'h0000 + z;
      end
      2'h2: begin
        out = 16'h0000 + (n ^ v);
      end
      2'h3: begin
        out = 16'h0000 + (z | (n ^ v));
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
