module day01 (
	input logic clk, rst,
	input logic d,
	output logic q_no_rst, q_sync_rst, q_async_rst
);

	always_ff @(posedge clk) begin: dff_no_rst
		q_no_rst <= d;
	end

	always_ff @(posedge clk) begin: dff_sync_rst
		if (rst)
			q_sync_rst <= 1'b0;
		else
			q_sync_rst <= d;
	end

	always_ff @(posedge clk or posedge rst) begin: dff_async_rst
		if (rst)
			q_async_rst <= 1'b0;
		else
			q_async_rst <= d;
	end

endmodule

