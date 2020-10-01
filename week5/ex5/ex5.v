module ex3
(
	input s,
	input r,
	output q,
	output q_n
);
	assign q = ~ ( r | q_n ) ;
	assign q_n = ~ ( s | q ) ;
endmodule

module ex4
(
	input clk ,
	input d,
	output q,
	output q_n
);
	wire r = ~d & clk;
	wire s = d & clk ;
	ex3 sr_latch (s, r, q, q_n) ;
endmodule


module ex5 
(
	input clk,
	input d,
	output q,
	output q_n
);
	wire n1;
	
	ex4 master (
		. clk ( ~ clk ) ,
		.d ( d ) ,
		.q ( n1 )
	);
	
	ex4 slave (
		. clk ( clk ) ,
		.d ( n1 ) ,
		.q ( q ) ,
		.q_n ( q_n )
	);
endmodule
