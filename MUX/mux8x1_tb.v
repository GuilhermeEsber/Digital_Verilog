module mux8x1_tb();
    reg [7:0] d;         // 8-bit data input
    reg [2:0] sel;       // 3-bit select input
    wire y;              // Output wire to monitor the mux output
    
    // Instantiate the MUX
    mux8x1_strut dut (.d(d), .sel(sel),.y(y));

    always begin
        #256 sel = sel + 1;
    end
    
    always begin
        #1 d = d + 1;  // Increment the data input every 5 time units to simulate different frequencies
    end
    
    initial begin
        sel = 3'b000; //  Initialize select input
        d = 8'b0;  // Initialize data input
        #2048 $stop;
    end
endmodule 