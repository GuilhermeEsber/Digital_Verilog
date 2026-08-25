module somador_3b ( 	
    input [2:0] A, 	
    input [2:0] B, 	
    input Cin, 	
    output [2:0] S, 	
    output Cout 
);   

    wire C1, C2; 	

    somador_struct I0(A[0], B[0], Cin, S[0], C1);
    somador_data I1(.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .Cout(C2));
    somador_behave I2(.A(A[2]), .B(B[2]), .Cin(C2), .S(S[2]), .Cout(Cout));

endmodule