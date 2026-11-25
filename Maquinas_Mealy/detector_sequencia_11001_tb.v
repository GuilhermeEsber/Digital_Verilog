`timescale 1ns / 100ps

module detector_sequencia_11001_tb;

    reg clk;
    reg rst;
    reg input_bit;
    wire output_bit;

    // Instanciação do módulo sob teste
    detector_sequencia_11001 dut (
        .clk(clk),
        .rst(rst),
        .input_bit(input_bit),
        .output_bit(output_bit)
    );

    // Geração do clock: período de 10ns (100 MHz)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;
        input_bit = 0;

        #10;
        rst = 1;

        // Aplicação da sequência na entrada
        input_bit = 1;  #10;
        input_bit = 1;  #10;
        input_bit = 0;  #10;
		  input_bit = 0;  #10;
        input_bit = 1;  #10;
        input_bit = 0;  #10;
        input_bit = 1;  #10;
        input_bit = 1;  #10;
        input_bit = 0;  #10;
		  input_bit = 0;  #10;
        input_bit = 1;  #10;
        input_bit = 1;  #10;

        // Espera final para observação
        #50;
        $stop;
    end

    // Monitoramento
    initial begin
        $display("Tempo\tin\tout");
        $monitor("%4t\t%b\t%b", $time, input_bit, output_bit);
    end

endmodule
