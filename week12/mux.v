module mux(
	funct, add_o, sub_o, srl_o, rd
);

input  [31:0] add_o, sub_o, srl_o;
input  [4:0] rd;
input  [5:0] funct;

always@ (*) begin
	case ( funct )
		6'b100000 : begin // Add
			glob.r[rd] = add_o;
		end
		6'b100010 : begin // Subtract
			glob.r[rd] = sub_o;
		end
		6'b000010 : begin // Shift
			glob.r[rd] = srl_o;
		end
	endcase
end
endmodule
