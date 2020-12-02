/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_regFiles_10 (
    input clk,
    input rst,
    input [3:0] write_address,
    input we,
    input [15:0] data,
    input [3:0] read_address_a,
    input [3:0] read_address_b,
    input init,
    input reset,
    input ts,
    output reg [15:0] out_a,
    output reg [15:0] out_b,
    output reg [15:0] player_a_score_display,
    output reg [15:0] player_b_score_display,
    output reg [15:0] question_A_display,
    output reg [15:0] question_B_display,
    output reg [15:0] question_Logic_display,
    output reg [15:0] time_countdown,
    output reg [15:0] round_display
  );
  
  
  
  wire [1-1:0] M_time_edge_out;
  reg [1-1:0] M_time_edge_in;
  edge_detector_18 time_edge (
    .clk(clk),
    .in(M_time_edge_in),
    .out(M_time_edge_out)
  );
  reg [255:0] M_registers_d, M_registers_q = 1'h0;
  wire [1-1:0] M_timer_value;
  counter_19 timer (
    .clk(clk),
    .rst(rst),
    .value(M_timer_value)
  );
  
  always @* begin
    M_registers_d = M_registers_q;
    
    out_a = M_registers_q[(read_address_a)*16+15-:16];
    out_b = M_registers_q[(read_address_b)*16+15-:16];
    M_time_edge_in = M_timer_value;
    if (init == 1'h1) begin
      M_registers_d[0+15-:16] = 1'h0;
      M_registers_d[16+15-:16] = 1'h0;
      M_registers_d[128+15-:16] = 1'h1;
    end
    if (reset == 1'h1) begin
      M_registers_d = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    end
    if (ts == 1'h1 && M_time_edge_out) begin
      if (M_registers_q[32+15-:16] != 1'h0) begin
        M_registers_d[32+15-:16] = M_registers_q[32+15-:16] - 1'h1;
      end
    end
    if (we == 1'h1) begin
      M_registers_d[(write_address)*16+15-:16] = data;
    end
    player_a_score_display = M_registers_q[0+15-:16];
    player_b_score_display = M_registers_q[16+15-:16];
    question_A_display = M_registers_q[48+15-:16];
    question_B_display = M_registers_q[64+15-:16];
    question_Logic_display = M_registers_q[80+15-:16];
    time_countdown = M_registers_q[32+15-:16];
    round_display = M_registers_q[128+15-:16];
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_registers_q <= 1'h0;
    end else begin
      M_registers_q <= M_registers_d;
    end
  end
  
endmodule