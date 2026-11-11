module controlador (
    input  wire clk,
    input  wire rst,
    input  wire req,
    output reg  ras,
    output reg  mux,
    output reg  cas
);

    localparam [2:0] IDLE = 3'd0,
                     S1   = 3'd1,
                     S2   = 3'd2,
                     S3   = 3'd3,
                     S4   = 3'd4;

    reg [2:0] state, next_state;

    always @(posedge clk or negedge rst) begin
        if (!rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = IDLE;
        ras = 1'b1;
        mux = 1'b0;
        cas = 1'b1;

        case (state)
            IDLE: begin
                next_state = req ? S1 : IDLE;
            end
            S1: begin
                ras = 1'b0;
                next_state = S2;
            end
            S2: begin
                ras = 1'b0;
                mux = 1'b1;
                next_state = S3;
            end
            S3: begin
                ras = 1'b0;
                mux = 1'b1;
                cas = 1'b0;
                next_state = S4;
            end
            S4: begin
                ras = 1'b0;
                mux = 1'b1;
                cas = 1'b0;
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

endmodule