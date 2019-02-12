`define ALU_THA 3'b000
`define ALU_THB 3'b001
`define ALU_AND 3'b010
`define ALU_OR  3'b011
`define ALU_SL  3'b100
`define ALU_SR  3'b101
`define ALU_ADD 3'b110
`define ALU_SUB 3'b111

module alu(
    input [15:0] a, b,
    input [2:0] com,
    output reg [15:0] y);
    
    always @(*) begin
        case(com)
            `ALU_THA: y = a;
            `ALU_THB: y = b;
            `ALU_AND: y = a & b;
            `ALU_OR:  y = a | b;
            `ALU_SL:  y = a << 1;
            `ALU_SR:  y = a >> 1;
            `ALU_ADD: y = a + b;
            `ALU_SUB: y = a - b;
            default:  y = 16'bzzzzzzzzzzzzzzzz;
        endcase
    end
endmodule
