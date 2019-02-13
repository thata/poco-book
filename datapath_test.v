`timescale 1ns/1ps

`include "def.h"

module datapath_test;
    parameter STEP = 10;

    reg [15:0] ina, inb;
    reg [2:0] incom;
    wire [15:0] outy;

    alu alu_1(.a(ina), .b(inb), .com(incom), .y(outy));

    initial begin
        $display("*** alu_test ***");
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_1);

        // through A
        ina <= 16'hFFFF;
        inb <= 16'h0000;
        incom <= `ALU_THA;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // through B
        ina <= 16'h0000;
        inb <= 16'hFFFF;
        incom <= `ALU_THB;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A and B
        ina <= 16'hFF00;
        inb <= 16'hAAAA;
        incom <= `ALU_AND;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A or B
        ina <= 16'hFF00;
        inb <= 16'hF0F0;
        incom <= `ALU_OR;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A << 1
        ina <= 16'h0008;
        inb <= 16'h0000;
        incom <= `ALU_SL;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A >> 1
        ina <= 16'h0008;
        inb <= 16'h0000;
        incom <= `ALU_SR;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A + 1
        ina <= 16'hFFFE;
        inb <= 16'h0001;
        incom <= `ALU_ADD;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A - 1
        ina <= 16'hFFF1;
        inb <= 16'h0001;
        incom <= `ALU_SUB;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        $finish;
    end
endmodule
