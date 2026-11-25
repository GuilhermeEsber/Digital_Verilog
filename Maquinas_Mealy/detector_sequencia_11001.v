
module detector_sequencia_11001 (
    input  wire clk,
    input  wire rst,
    input  wire input_bit,
    output reg  output_bit
);

    localparam [2:0] S0 = 3'd0,
                     S1 = 3'd1,
                     S2 = 3'd2,
                     S3 = 3'd3,
                     S4 = 3'd4;

    reg [2:0] state, next_state;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = S0;
        output_bit = 1'b0;

        case (state)

            S0: begin
                next_state = input_bit ? S1 : S0;
            end

            S1: begin
                next_state = input_bit ? S2 : S0;
            end

            S2: begin
                next_state = input_bit ? S2 : S3;
            end

            S3: begin
                next_state = input_bit ? S1 : S4;
            end

            S4: begin
                output_bit = input_bit ? 1'b1 : 1'b0;
                next_state = input_bit ? S1 : S0;
            end

            default: begin
                next_state = S0;
            end

        endcase
    end

endmodule
