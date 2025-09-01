module uart_tx #(parameter DATA_WIDTH = 8)(
    input clk,
    input tick,
    input [DATA_WIDTH-1:0] data_in,
    input send,
    output reg tx,
    output reg busy
);
    reg [3:0] bit_index;
    reg [DATA_WIDTH-1:0] shift_reg;
    reg sending;

    initial begin
        tx = 1;
        busy = 0;
        sending = 0;
        bit_index = 0;
    end

    always @(posedge clk) begin
        if(send && !busy) begin
            busy <= 1;
            sending <= 1;
            shift_reg <= data_in;
            bit_index <= 0;
            tx <= 0; // start bit
        end else if(tick && sending) begin
            if(bit_index < DATA_WIDTH) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                bit_index <= bit_index + 1;
            end else begin
                tx <= 1; // stop bit
                busy <= 0;
                sending <= 0;
            end
        end
    end
endmodule
