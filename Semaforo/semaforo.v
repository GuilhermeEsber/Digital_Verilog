module semaforo (
    input A, B, C, D,
    output FA, FB, FC, FD
);

    assign FA = A;
    assign FB = ~A & B;
    assign FC = ~A & ~B & C;
    assign FD = ~A & ~B & ~C & D;

endmodule
