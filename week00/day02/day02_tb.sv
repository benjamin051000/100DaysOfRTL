module day02_tb;
	logic clk = 0, rst;
	logic a, rising_edge, falling_edge;

	day02 dut (.*);

	initial begin: generate_clk
		while(1) #5 clk = ~clk;
	end

	// Stimulus
	initial begin
		rst <= 1;
		a <= 1;
		@(posedge clk);

		rst <= 0;
		@(posedge clk);

		for (int i = 0; i < 32; i++) begin
			a <= $random % 2;
			@(posedge clk);
		end

		disable generate_clk;
		$finish();
	end

	// Dump VCD
	initial begin
		$dumpfile("day02.vcd");
		$dumpvars(0, day02_tb);
	end

endmodule
