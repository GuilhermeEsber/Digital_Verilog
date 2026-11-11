
module detector_sequencia_1101_tb;

    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instanciação do módulo sob teste
    detector_sequencia_1101 dut (
        .clk(clk),
        .rst(rst),
        .bit_entrada(in),
        .bit_saida(out)
    );

    // Geração do clock: período de 10ns (100 MHz)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        in = 0;

        #10;
        rst = 0;

        // Aplicação da sequência na entrada
        in = 1;  #10;
        in = 1;  #10;
        in = 0;  #10;
        in = 1;  #10;
        in = 0;  #10;
        in = 0;  #10;
        in = 1;  #10;
        in = 1;  #10;
        in = 0;  #10;
        in = 1;  #10;
        in = 0;  #10;
        in = 1;  #10;

        // Espera final para observação
        #50;
        $stop;
    end

    // Monitoramento
    initial begin
        $display("Tempo\tin\tout");
        $monitor("%4t\t%b\t%b", $time, in, out);
    end

endmodule
