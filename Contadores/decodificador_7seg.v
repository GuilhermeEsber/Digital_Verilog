// A sendo o MSB, G sendo LSB
module decodificador_7seg (
    input  [3:0] DCBA,
    output reg [6:0] abcdefg
);

    always @(*) begin
        case (DCBA)
            4'b0000: abcdefg = 7'b0000001; // 0
            4'b0001: abcdefg = 7'b1001111; // 1
            4'b0010: abcdefg = 7'b0010010; // 2
            4'b0011: abcdefg = 7'b0000110; // 3
            4'b0100: abcdefg = 7'b1001100; // 4
            4'b0101: abcdefg = 7'b0100100; // 5
            4'b0110: abcdefg = 7'b0100000; // 6
            4'b0111: abcdefg = 7'b0001111; // 7
            4'b1000: abcdefg = 7'b0000000; // 8
            4'b1001: abcdefg = 7'b0000100; // 9
            4'b1010: abcdefg = 7'b0001000; // A
            4'b1011: abcdefg = 7'b1100000; // b
            4'b1100: abcdefg = 7'b0110001; // C
            4'b1101: abcdefg = 7'b1000010; // d
            4'b1110: abcdefg = 7'b0110000; // E
            4'b1111: abcdefg = 7'b0111000; // F

            default: abcdefg = 7'b1111111;
        endcase
    end

endmodule

//G sendo MSB, A sendo LSB
//module decodificador_7seg (
//    input  [3:0] DCBA,
//    output reg [6:0] gfedcba
//);
//
//    always @(*) begin
//        case (DCBA)
//            4'b0000: gfedcba = 7'b1000000; // 0
//            4'b0001: gfedcba = 7'b1111001; // 1
//            4'b0010: gfedcba = 7'b0100100; // 2
//            4'b0011: gfedcba = 7'b0110000; // 3
//            4'b0100: gfedcba = 7'b0011001; // 4
//            4'b0101: gfedcba = 7'b0010010; // 5
//            4'b0110: gfedcba = 7'b0000010; // 6
//            4'b0111: gfedcba = 7'b1111000; // 7
//            4'b1000: gfedcba = 7'b0000000; // 8
//            4'b1001: gfedcba = 7'b0010000; // 9
//            4'b1010: gfedcba = 7'b0001000; // A
//            4'b1011: gfedcba = 7'b0000011; // b
//            4'b1100: gfedcba = 7'b1000110; // C
//            4'b1101: gfedcba = 7'b0100001; // d
//            4'b1110: gfedcba = 7'b0000110; // E
//            4'b1111: gfedcba = 7'b0001110; // F
//
//            default: gfedcba = 7'b1111111;
//        endcase
//    end
//
//endmodule
