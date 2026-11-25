module maquina_fsm (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] mnm_in,
    input  wire       ula_ack,
    input  wire       wr_ack,
    input  wire       pc_ack,
    input  wire       ri_ack,
    output reg        ena_pc,
    output reg        ena_ri,
    output reg        ena_wr,
    output reg        sel_r0_rd,
    output reg        sel_addr_data,
    output reg        sel_ldr_ula,
    output reg        ena_ula
);

reg [2:0] estado_atual, proximo_estado;

localparam PC = 3'd0,
           FETCH = 3'd1,
           LDR = 3'd2,
           ARIT = 3'd3,
           WB_RD = 3'd4,
           LOGICA = 3'd5,
           WB_R0 = 3'd6;

always @(estado_atual)
begin
    ena_pc        = 1'b0;
    ena_ri        = 1'b0;
    ena_wr        = 1'b0;
    sel_r0_rd     = 1'b0;
    sel_addr_data = 1'b0;
    sel_ldr_ula   = 1'b0;
    ena_ula       = 1'b0;

    case (estado_atual)

        PC: ena_pc = 1'b1;

        FETCH: ena_ri = 1'b1;

        LDR: begin
            ena_wr      = 1'b1;
            sel_r0_rd   = 1'b1;
            sel_ldr_ula = 1'b1;
        end

        ARIT, LOGICA: begin
            sel_addr_data = 1'b1;
            ena_ula       = 1'b1;
        end

        WB_RD: begin
            ena_wr    = 1'b1;
            sel_r0_rd = 1'b1;
        end

        WB_R0: ena_wr = 1'b1;

        default: ena_pc = 1'b0;

    endcase
end

always @(*)
begin
    case (estado_atual)

        PC: if (pc_ack) proximo_estado = FETCH;
            else proximo_estado = PC;

        FETCH: if (!ri_ack) proximo_estado = FETCH;
            else if (mnm_in == 2'b00) proximo_estado = LDR;
            else if (mnm_in == 2'b01) proximo_estado = LOGICA;
            else proximo_estado = ARIT;

        LDR: if (wr_ack) proximo_estado = PC;
            else proximo_estado = LDR;

        ARIT: if (ula_ack) proximo_estado = WB_RD;
            else proximo_estado = ARIT;

        WB_RD: if (wr_ack) proximo_estado = PC;
            else proximo_estado = WB_RD;

        LOGICA: if (ula_ack) proximo_estado = WB_R0;
            else proximo_estado = LOGICA;

        WB_R0: if (wr_ack) proximo_estado = PC;
            else proximo_estado = WB_R0;

        default: proximo_estado = FETCH;

    endcase
end

always @(posedge clk, negedge rst)
begin
    if (!rst)
        estado_atual <= FETCH;
    else
        estado_atual <= proximo_estado;
end

endmodule