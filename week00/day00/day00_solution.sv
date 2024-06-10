module day00 (
	input logic a,
	input logic b,
	input logic select,
	output logic y
);

	assign y = select ? b : a;

endmodule
