module contador_condicional_sincrono (
    input clk, rst,
    output reg [3:0] XYZW
);

always @ (negedge clk)
begin
    if (!rst)
        XYZW <= 4'b0001;
    else
    begin
        case (XYZW)
            4'b0001: XYZW <= 4'b0011; // 1 -> 3
            4'b0011: XYZW <= 4'b0101; // 3 -> 5
            4'b0101: XYZW <= 4'b0000; // 5 -> 0
            4'b0000: XYZW <= 4'b0010; // 0 -> 2
            4'b0010: XYZW <= 4'b0100; // 2 -> 4
            4'b0100: XYZW <= 4'b0110; // 4 -> 6
            4'b0110: XYZW <= 4'b0111; // 6 -> 7
            4'b0111: XYZW <= 4'b1000; // 7 -> 8
            4'b1000: XYZW <= 4'b1001; // 8 -> 9
            4'b1001: XYZW <= 4'b1010; // 9 -> 10
            4'b1010: XYZW <= 4'b1111; // 10 -> 15
            4'b1111: XYZW <= 4'b1110; // 15 -> 14
            4'b1110: XYZW <= 4'b1101; // 14 -> 13
            4'b1101: XYZW <= 4'b1100; // 13 -> 12
            4'b1100: XYZW <= 4'b1011; // 12 -> 11
            4'b1011: XYZW <= 4'b0001; // 11 -> 1
            default: XYZW <= 4'b0000;
        endcase
    end 
end

endmodule