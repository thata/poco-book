module adder_test;
    parameter STEP = 10;
    reg ina, inb;
    wire outs;

    adder adder_1(.a(ina), .b(inb), .s(outs));

    initial begin
        $display("*** adder_test ***");

        ina <= 1'b0;
        inb <= 1'b0;
        #STEP
        $display("a:%b b:%b s:%b", ina, inb, outs);

        ina <= 1'b0;
        inb <= 1'b1;
        #STEP
        $display("a:%b b:%b s:%b", ina, inb, outs);

        ina <= 1'b1;
        inb <= 1'b0;
        #STEP
        $display("a:%b b:%b s:%b", ina, inb, outs);

        ina <= 1'b1;
        inb <= 1'b1;
        #STEP
        $display("a:%b b:%b s:%b", ina, inb, outs);

        $finish;
    end
endmodule
