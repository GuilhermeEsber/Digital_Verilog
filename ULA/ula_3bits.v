module ula_3bits (
	input [2:0] A,
	input [2:0] B,
	input [2:0] S,
	output reg [3:0] F
); 

	always @(*) begin 
		case(S)
			3'b000: F = {1'b0, A & B}; // AND Lógico
			3'b001: F = {1'b0, A | B}; // OR Lógico
			3'b010: F = A + B; //Soma
			3'b011: F = {1'b0, ~A}; // NOT de A
			3'b100: F = {1'b0, (A & ~B)}; // A AND (NOT)B
			3'b101: F = {1'b0, (A | ~B)}; // A OR (NOT) B
			3'b110: F = A - B; // Subtração
			3'b111: F = A < B; // A menor que B? Se sim da 1 se não da 0
			default: F = 4'b0000; // Padrão 
		endcase 
	end
	
endmodule 