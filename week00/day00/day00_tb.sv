module day00_tb;

logic a, b, y;
logic select;

day00 dut (.*);

initial begin: driver
	repeat(30) begin
		a = $random % 2;
		b = $random % 2;;
		select = $random % 2;
		#5;
	end
end: driver

initial begin
	$dumpfile("day00.vcd");
	$dumpvars(0, day00_tb);
end

endmodule
