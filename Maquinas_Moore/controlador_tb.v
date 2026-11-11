`timescale 1ns/1ps

module controlador_tb;

    reg clk, rst, req;
    wire ras, mux, cas;

    controlador dut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .ras(ras),
        .mux(mux),
        .cas(cas)
    );

    // Geração do clock
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Testbench
    initial begin
        $dumpfile("tb_mem_ctl.vcd");
        $dumpvars(0, controlador_tb);

        $monitor("t=%0t rst=%b req=%b | RAS=%b MUX=%b CAS=%b",
                 $time, rst, req, ras, mux, cas);

        // Inicialização
        rst = 1'b0;
        req = 1'b0;

        // Libera reset
        #12 rst = 1'b1;

        // Primeira requisição
        #13 req = 1'b1;
        #10 req = 1'b0;

        #80;

        // Requisições durante o funcionamento
        req = 1'b1;
        #10 req = 1'b0;
        #10 req = 1'b1;
        #10 req = 1'b0;
        #10 req = 1'b1;
        #10 req = 1'b0;

        #60;

        // Nova requisição
        req = 1'b1;
        #10 req = 1'b0;

        // Acionamento do reset durante a operação
        #20 rst = 1'b0;
        #10 rst = 1'b1;

        #50;

        $finish;
    end

endmodule