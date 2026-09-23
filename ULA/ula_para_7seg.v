module ula_para_7seg (
	input [2:0] A,
	input [2:0] B,
	input [2:0] S,
	output [6:0] display
);
	
	wire [3:0] resultado_ula;
	
	ula_3bits I0 (
		.A(A[2:0]),
		.B(B[2:0]),
		.S(S[2:0]),
		.F(resultado_ula[3:0])
	);

	decodificador_7seg I1 (
		.DCBA(resultado_ula[3:0]),
		.gfedcba(display[6:0])
	);

endmodule