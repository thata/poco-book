`timescale 1ns/1ps

module alu_test;
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
        incom <= 3'b000;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // through B
        ina <= 16'h0000;
        inb <= 16'hFFFF;
        incom <= 3'b001;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A and B
        ina <= 16'hFF00;
        inb <= 16'hAAAA;
        incom <= 3'b010;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A or B
        ina <= 16'hFF00;
        inb <= 16'hF0F0;
        incom <= 3'b011;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A << 1
        ina <= 16'h0008;
        inb <= 16'h0000;
        incom <= 3'b100;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A >> 1
        ina <= 16'h0008;
        inb <= 16'h0000;
        incom <= 3'b101;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A + 1
        ina <= 16'hFFFE;
        inb <= 16'h0001;
        incom <= 3'b110;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        // A - 1
        ina <= 16'hFFF1;
        inb <= 16'h0001;
        incom <= 3'b111;
        #STEP
        $display("a:%b b:%b com:%b, y:%b", ina, inb, incom, outy);

        $finish;
    end
endmodule
