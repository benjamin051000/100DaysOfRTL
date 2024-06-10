# Day 0
Design and verify a 2-to-1 [multiplexer](https://en.wikipedia.org/wiki/Multiplexer).

## Interface Definition
The module should have the following interface:

```systemverilog
module day00 (
	input logic a,
	input logic b,
	input logic select,
	output logic y
);
```

# Goals
- run `make` and observe no compilation errors.
- run `make sim` and observe no simulation errors.
- run `make synth` and observe no synthesis errors.

> [!TIP]
> Run `make solution` to see a simulation and synthesis output for the given 
> solution, `day00_solution.sv`.

