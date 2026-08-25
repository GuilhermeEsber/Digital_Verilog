module demux14 (
    input D,
    input S1,
    input S0,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);

    assign Y0 = D & ~S1 & ~S0;
    assign Y1 = D & ~S1 & S0;
    assign Y2 = D & S1 & ~S0;
    assign Y3 = D & S1 & S0;

endmodule 