module main_decoder (
	input [5:0] opcode,
	output reg MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite,
	output reg [1:0] ALUOp
);

always@ (*) begin
	case ( opcode )
		6'h00 : begin // R-type
			RegWrite = 1;
			RegDst   = 1;
			ALUSrc   = 0;
			Branch   = 0;
			MemWrite = 0;
			MemtoReg = 0;
			ALUOp = 2'b10;
		end
		6'h23 : begin // lw
			RegWrite = 1;
			RegDst   = 0;
			ALUSrc   = 1;
			Branch   = 0;
			MemWrite = 0;
			MemtoReg = 1;
			ALUOp = 2'b00;
		end
		6'h2B : begin // sw
			RegWrite = 0;
			RegDst   = 0; // X
			ALUSrc   = 1;
			Branch   = 0;
			MemWrite = 1;
			MemtoReg = 0; // X
			ALUOp = 2'b00;
		end
		6'h04 : begin // beq
			RegWrite = 0;
			RegDst   = 0; // X
			ALUSrc   = 0;
			Branch   = 1;
			MemWrite = 0;
			MemtoReg = 0; // X
			ALUOp = 2'b01;
		end
	endcase
end

endmodule
