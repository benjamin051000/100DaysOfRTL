 // An edge detector


module day02 (
	input logic clk, rst,
	input logic a,
	output logic rising_edge, falling_edge
);

  logic a_ff;

  always_ff @(posedge clk or posedge rst)
    if (rst)
      a_ff <= 1'b0;
    else
      a_ff <= a;

  // Rising edge when delayed signal is 0 but current is 1
  assign rising_edge = ~a_ff & a;

  // Falling edge when delayed signal is 1 but current is 0
  assign falling_edge = a_ff & ~a;

endmodule
