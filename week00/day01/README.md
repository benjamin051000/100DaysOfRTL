# Day 1
Create a module that contains several [D flip-flops](https://en.wikipedia.org/wiki/Flip-flop_(electronics)#D_flip-flop) with the following reset logic behavior:
- No reset
- Syncronous reset
- Asynchronous reset

## Interface Definition
The module should have the following interface:

```systemverilog
module day02 (
	input logic clk, rst,
	input logic d,
	output logic q_no_rst, q_sync_rst, q_async_rst
);
```

# Goals
- run `make` and observe no compilation errors.
- run `make sim` and observe no simulation errors.
- run `make synth` and observe no synthesis errors.

> [!TIP]
> Run `make solution` to see a simulation and synthesis output for the given 
> solution, `day00_solution.sv`.

