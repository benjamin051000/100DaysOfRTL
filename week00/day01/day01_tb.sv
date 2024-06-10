module day01_tb;

	logic clk, rst;
	logic d;
	logic q_no_rst, q_sync_rst, q_async_rst;

	day01 dut (.*);

	// Generate clk
	always begin
		clk = 1'b1;
		#5;
		clk = 1'b0;
		#5;
	end

	// Stimulus
	initial begin
		rst = 1'b1;
		d = 1'b0;
		@(posedge clk);
		rst = 1'b0;
		@(posedge clk);
		d = 1'b1;
		@(posedge clk);
		@(posedge clk);
		@(negedge clk);
		rst = 1'b1;
		@(posedge clk);
		@(posedge clk);
		rst = 1'b0;
		@(posedge clk);
		@(posedge clk);
		$finish();
	end

	// Dump VCD
	initial begin
		$dumpfile("day01.vcd");
		$dumpvars(0, day01_tb);
	end


endmodule
