module ex2
(
	input [1:0] KEY, //keys
	//displays
	output [7:0] HEX0,
	output [7:0] HEX1,
	output [7:0] HEX2,
	output [7:0] HEX3,
	output [7:0] HEX4,
	output [7:0] HEX5
);
// 15.06.02
genvar j;
generate
	for (j=0; j<6; j=j+1)
	begin: gen2
		case(j)
		// 1
		0: assign HEX0[4]=~KEY[0],
					 HEX0[5]=~KEY[0];
		// 5.
		1: assign HEX1[0]=~KEY[0],
					 HEX1[2]=~KEY[0],
					 HEX1[3]=~KEY[0],
					 HEX1[5]=~KEY[0],
					 HEX1[6]=~KEY[0],
					 HEX1[7]=~KEY[0];
		// 0
		2: assign HEX2[0]=~KEY[0],
					 HEX2[1]=~KEY[0],
					 HEX2[2]=~KEY[0],
					 HEX2[3]=~KEY[0],
					 HEX2[4]=~KEY[0],
					 HEX2[5]=~KEY[0];
		// 6.
		3: assign HEX3[0]=~KEY[0],
					 HEX3[2]=~KEY[0],
					 HEX3[3]=~KEY[0],
					 HEX3[4]=~KEY[0],
					 HEX3[5]=~KEY[0],
					 HEX3[6]=~KEY[0],
					 HEX3[7]=~KEY[0];
		// 0
		4: assign HEX4[0]=~KEY[0],
					 HEX4[1]=~KEY[0],
					 HEX4[2]=~KEY[0],
					 HEX4[3]=~KEY[0],
					 HEX4[4]=~KEY[0],
					 HEX4[5]=~KEY[0];
		// 2
		5: assign HEX5[0]=~KEY[0],
					 HEX5[1]=~KEY[0],
					 HEX5[3]=~KEY[0],
					 HEX5[4]=~KEY[0],
					 HEX5[6]=~KEY[0],
					 HEX5[7]=~KEY[0];
		endcase
	end
endgenerate
endmodule
