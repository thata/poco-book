`include "def.h"

module datapath(
    input clock,
    input reset_n,
    input [`DATA_W-1:0] datain,
    input [`SEL_W-1:0] com,
    output [`DATA_W-1:0] accout);
    
    reg [`DATA_W-1:0] accum;
    wire [`DATA_W-1:0] alu_y;

    assign accout = accum;
    alu alu_1(.a(accum), .b(datain), .com(com), .y(alu_y));

    always @(posedge clock or negedge reset_n) begin
        if (!reset_n) accum <= `DATA_W'b0;
        else accum <= alu_y;
    end
endmodule
