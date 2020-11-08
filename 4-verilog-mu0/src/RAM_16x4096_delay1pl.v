/*  Implements a 16-bit x 4K RAM, with single-cycle register read.
    This is synthesisable, and should turn into block-ram.
*/
module RAM_16x4096_delay1pl(
    input logic clk,
    input logic[11:0] address1,
    input logic[11:0] address2,
    input logic write,
    input logic read,
    input logic[15:0] writedata,
    output logic[15:0] readdata1,
    output logic[15:0] readdata2
);
    parameter RAM_INIT_FILE = "";

    reg [15:0] memory [4095:0];

    initial begin
        integer i;
        /* Initialise to zero by default */
        for (i=0; i<4096; i++) begin
            memory[i]=0;
        end
        /* Load contents from file if specified */
        if (RAM_INIT_FILE != "") begin
            $display("RAM : INIT : Loading RAM contents from %s", RAM_INIT_FILE);
            $readmemh(RAM_INIT_FILE, memory);
        end
    end

    //assign readdata1 = read ? memory[address11] : 16'hxxxx;

    /* Synchronous write path */
    always @(posedge clk) begin
        //$display("RAM : INFO : read=%h, addr = %h, mem=%h", read, address1, memory[address1]);
        if (write) begin
            memory[address1] <= writedata;
        end
        readdata1 <= memory[address1]; // Read-after-write mode
        readdata2 <= memory[address2];
    end
endmodule
