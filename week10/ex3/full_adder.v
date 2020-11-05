module full_adder (
	
	x,
   y,
   carry_in,
   z,
	carry_out
	);
	
	input  x, y, carry_in;
	output z, carry_out;
	
	assign z         = (x ^ y) ^ carry_in;
	assign carry_out = (x & y) | ((x ^ y) & carry_in);
	
	
endmodule