module alu(
    input [15:0] a, b,
    input [2:0] com,
    output [15:0] y);
    
    reg [15:0] y_reg;

    assign y = y_reg;

    always @(*) begin
        case(com)
            3'b000: y_reg <= a;
            3'b001: y_reg <= b;
            3'b010: y_reg <= a & b;
            3'b011: y_reg <= a | b;
            3'b100: y_reg <= a << 1;
            3'b101: y_reg <= a >> 1;
            3'b110: y_reg <= a + b;
            default: y_reg <= a - b;
        endcase
    end
endmodule
