module ripple_carry
	#(
		parameter width = 16
	)

	(
		input [width -1:0]  x, y,
		output [width -1:0] out,
		output overflow
	);
	
	wire [width:0]   carry;
	wire [width-1:0] sum;
	
	assign carry[0] = 1'b0;
	
	generate
		genvar i;
		for (i = 0; i < width; i = i +1)
		begin : block_name
			full_adder fa(x[i], y[i], carry[i], out[i], carry[i+1]);
		end
	endgenerate
	
	assign overflow = carry[16];
	
endmodule
