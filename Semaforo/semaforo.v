module semaforo (
    input A, B, C, D,
    output FA, FB, FC, FD
);

    assign FA = A;
    assign FB = ~A & B;
    assign FC = ~A & ~B & C;
    assign FD = ~A & ~B & ~C & D;

endmodule

// module semaforo (
//     input A, B, C, D,
//     output reg FA, FB, FC, FD
// );

//     always @(*) begin
//         FA = 0;
//         FB = 0;
//         FC = 0;
//         FD = 0;

//         if (A)
//             FA = 1;
//         else if (B)
//             FB = 1;
//         else if (C)
//             FC = 1;
//         else if (D)
//             FD = 1;
//     end

// endmodule
