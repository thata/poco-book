`include "def.h"

module alu(
    input [`DATA_W-1:0] a, b,
    input [`SEL_W-1:0] com,
    output reg [`DATA_W-1:0] y);
    
    always @(*) begin
        case(com)
            `ALU_THA: y <= a;
            `ALU_THB: y <= b;
            `ALU_AND: y <= a & b;
            `ALU_OR:  y <= a | b;
            `ALU_SL:  y <= a << 1;
            `ALU_SR:  y <= a >> 1;
            `ALU_ADD: y <= a + b;
            `ALU_SUB: y <= a - b;
            default:  y <= 16'bzzzzzzzzzzzzzzzz;
        endcase
    end
endmodule
