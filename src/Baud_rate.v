module Baud_rate #(parameter CLOCK_FREQ = 50000000, BAUD_RATE = 9600)(
    input clk,
    output reg tick
);
    integer count;
    integer limit;

    initial begin
        tick = 0;
        count = 0;
        limit = CLOCK_FREQ / BAUD_RATE;
    end

    always @(posedge clk) begin
        if(count == limit/2) begin
            tick <= 1;
            count <= 0;
        end else begin
            tick <= 0;
            count <= count + 1;
        end
    end
endmodule
