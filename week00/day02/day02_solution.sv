module day02 (
	input logic clk, rst,
	input logic a,
	output logic rising_edge, falling_edge
);

  logic prev_a;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      prev_a <= 1'b0;
    else
      prev_a <= a;
  end

  // Rising edge when delayed signal is 0 but current is 1
  assign rising_edge = ~prev_a & a;

  // Falling edge when delayed signal is 1 but current is 0
  assign falling_edge = prev_a & ~a;

endmodule

