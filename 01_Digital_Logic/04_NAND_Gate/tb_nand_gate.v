`timescale 1ns/1ps

module tb_nand_gate;
    reg a, b;
    wire y;

    nand_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

integer passed_tests;
integer failed_tests;

initial begin

    passed_tests = 0;
    failed_tests = 0;

    $monitor("a=%b, b=%b, y=%b", a, b, y);

    a = 1'b0; b = 1'b0; 
    #1;
    if (y !== 1'b1) begin
        $display("Test failed for a=0, b=0");
        failed_tests = failed_tests + 1;
    end else begin
        $display("Test passed for a=0, b=0");
        passed_tests = passed_tests + 1;
    end


    a = 1'b0; b = 1'b1;
    #1;
    if (y !== 1'b1) begin
        $display("Test failed for a=0, b=1");
        failed_tests = failed_tests + 1;
    end else begin
        $display("Test passed for a=0, b=1");
        passed_tests = passed_tests + 1;
    end


    a = 1'b1; b = 1'b0;
    #1;
    if (y !== 1'b1) begin
        $display("Test failed for a=1, b=0");
        failed_tests = failed_tests + 1;
    end else begin
        $display("Test passed for a=1, b=0");
        passed_tests = passed_tests + 1;
    end


    a = 1'b1; b = 1'b1;
    #1;
    if (y !== 1'b0) begin
        $display("Test failed for a=1, b=1");
        failed_tests = failed_tests + 1;
    end else begin
        $display("Test passed for a=1, b=1");
        passed_tests = passed_tests + 1;
    end

    $display("Passed tests: %0d", passed_tests);
    $display("Failed tests: %0d", failed_tests);
    $display("Total tests: %0d", passed_tests + failed_tests);
    $finish;

end
endmodule