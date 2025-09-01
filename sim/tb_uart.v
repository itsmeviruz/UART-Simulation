`timescale 1ns/1ps

module tb_uart();
    reg clk;
    reg [7:0] data_in;
    reg send;
    wire tx;
    wire [7:0] data_out;
    wire ready;

    parameter CLOCK_PERIOD = 20;

    wire tick;
    Baud_rate #(50000000, 9600) baud(.clk(clk), .tick(tick));


    uart_tx tx_inst(.clk(clk), .tick(tick), .data_in(data_in), .send(send), .tx(tx), .busy());

    uart_rx rx_inst(.clk(clk), .tick(tick), .rx(tx), .data_out(data_out), .ready(ready));

    initial clk = 0;
    always #(CLOCK_PERIOD/2) clk = ~clk;

    initial begin
        data_in = 8'b1011; // change your data here (e.g, it can be b,d,h,o)
        send = 0;
        #100;
        send = 1;
        #20;
        send = 0;

        wait(ready == 1);
        $display("Sent data: %d, Received data: %d", data_in, data_out);
        $finish;
    end
endmodule
