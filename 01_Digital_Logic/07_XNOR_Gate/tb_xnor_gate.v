`timescale 1ns/1ps

module tb_xnor_gate;
    reg a;
    reg b;
    wire y;

    xnor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

integer passed_tests = 0;
integer failed_tests = 0;

initial begin

    passed_tests = 0;
    failed_tests = 0;

        // Test case 1: a = 0, b = 0
        #10;
        a = 1'b0; b = 1'b0;
        #1;
        if (y!== 1'b1) begin
            $display("Test case 1 failed: a = %b, b = %b, y = %b", a, b, y);
            failed_tests = failed_tests + 1;
        end else begin
            $display("Test case 1 passed: a = %b, b = %b, y = %b", a, b, y);
            passed_tests = passed_tests + 1;
        end

        // Test case 2: a = 0, b = 1
        #10;
        a = 1'b0; b = 1'b1;
        #1;
        if (y!== 1'b0) begin
            $display("Test case 2 failed: a = %b, b = %b, y = %b", a, b, y);
            failed_tests = failed_tests + 1;
        end else begin
            $display("Test case 2 passed: a = %b, b = %b, y = %b", a, b, y);
            passed_tests = passed_tests + 1;
        end

        // Test case 3: a = 1, b = 0
        #10;
        a = 1'b1; b = 1'b0;
        #1;
        if (y!== 1'b0) begin
            $display("Test case 3 failed: a = %b, b = %b, y = %b", a, b, y);
            failed_tests = failed_tests + 1;
        end else begin
            $display("Test case 3 passed: a = %b, b = %b, y = %b", a, b, y);
            passed_tests = passed_tests + 1;
        end

        // Test case 4: a = 1, b = 1
        #10;
        a = 1'b1; b = 1'b1;
        #1;
        if (y!== 1'b1) begin
            $display("Test case 4 failed: a = %b, b = %b, y = %b", a, b, y);
            failed_tests = failed_tests + 1;
        end else begin
            $display("Test case 4 passed: a = %b, b = %b, y = %b", a, b, y);
            passed_tests = passed_tests + 1;
        end

        $display("Total tests: %d", passed_tests + failed_tests);
        $display("Passed tests: %d", passed_tests);
        $display("Failed tests: %d", failed_tests);
        $finish;
    end
endmodule