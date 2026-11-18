module detector_sequencia_11001 (clk, input_bit, rst, output_bit);
    input wire clk, input_bit, rst;
    output reg output_bit;
    reg [2:0] state;
    localparam S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;

    always @(*) begin
        case (state)
            S0, S1, S2, S3: output_bit = 1'b0;
            S4:             if (input_bit) output_bit = 1'b1; else output_bit = 1'b0;
            default:        output_bit = 1'b0;
        endcase
    end

    always @(posedge clk, negedge rst) begin
        if (!rst)
            state <= S0;
        else
            case (state)
                S0:      if (input_bit) state <= S1;
                         else           state <= S0;
                S1:      if (input_bit) state <= S2;
                         else           state <= S0;
                S2:      if (input_bit) state <= S2;
                         else           state <= S3;
                S3:      if (input_bit) state <= S1;
                         else           state <= S4;
                S4:      if (input_bit) state <= S1;
                         else           state <= S0;
                default: state <= S0;
            endcase
    end
endmodule