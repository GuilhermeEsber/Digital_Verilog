module mux2x1 (
    input  [1:0] d,
    input        sel,
    output       y
);

    assign y = sel ? d[1] : d[0];

endmodule 