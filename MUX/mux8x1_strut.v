module mux8x1_strut (
    input  [7:0] d,
    input  [2:0] sel,
    output       y
);

    wire y0;
    wire y1;

    mux4x1 I0 (
        .d(d[3:0]),
        .sel(sel[1:0]),
        .y(y0)
    );

    mux4x1 I1 (
        .d(d[7:4]),
        .sel(sel[1:0]),
        .y(y1)
    );

    mux2x1 I2 (
        .d({y1, y0}),
        .sel(sel[2]),
        .y(y)
    );

endmodule 