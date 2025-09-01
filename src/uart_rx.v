module uart_rx #(parameter DATA_WIDTH = 8)(
    input clk,
    input tick,
    input rx,
    output reg [DATA_WIDTH-1:0] data_out,
    output reg ready
);
    reg [3:0] bit_index;
    reg [DATA_WIDTH-1:0] shift_reg;
    reg receiving;
    integer half_tick;

    initial begin
        data_out = 0;
        ready = 0;
        bit_index = 0;
        receiving = 0;
        half_tick = 0;
    end

    always @(posedge clk) begin
        ready <= 0;
        if(!receiving && rx == 0) begin
            receiving <= 1;
            half_tick <= 1; // wait half bit
            bit_index <= 0;
        end else if(receiving && tick) begin
            if(half_tick > 0) begin
                half_tick <= 0; // sample at center next time
            end else begin
                shift_reg <= {rx, shift_reg[DATA_WIDTH-1:1]};
                bit_index <= bit_index + 1;
                if(bit_index == DATA_WIDTH-1) begin
                    data_out <= {rx, shift_reg[DATA_WIDTH-1:1]};
                    ready <= 1;
                    receiving <= 0;
                end
            end
        end
    end
endmodule
