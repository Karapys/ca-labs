module alu_decoder
(
     ALUOp, Funct, ALUControl
);

input     [1:0]  ALUOp;
input      [5:0]  Funct; 
output  reg [2:0]  ALUControl;

always@ (*) begin
  case ( ALUOp )
    2'b00 : begin // Add
      ALUControl = 3'b010;
    end
    2'b01 : begin // Subtract
      ALUControl = 3'b110;
    end
    2'b11 : begin // Subtract
      ALUControl = 3'b110;
    end
    2'b10 : begin // Something
      case ( Funct )
      6'h20 : begin // Add
        ALUControl = 3'b010;
      end
      6'h22 : begin // Subtract
        ALUControl = 3'b110;
      end
      6'h24 : begin // and
        ALUControl = 3'b000;
      end
      6'h25 : begin // or
        ALUControl = 3'b001;
      end
      6'h2A : begin // set less than
        ALUControl = 3'b111;
      end
      endcase
    end
    2'b11 : begin // Something
      case ( Funct )
      6'h20 : begin // Add
        ALUControl = 3'b010;
      end
      6'h22 : begin // Subtract
        ALUControl = 3'b110;
      end
      6'h24 : begin // and
        ALUControl = 3'b000;
      end
      6'h25 : begin // or
        ALUControl = 3'b001;
      end
      6'h2A : begin // set less than
        ALUControl = 3'b111;
      end
      endcase
    end
  endcase
end

endmodule
