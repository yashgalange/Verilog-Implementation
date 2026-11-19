`timescale 1ns / 1ps

module tb_half_subtractor;
    reg a;
    reg b;
    wire d;
    wire b_out;

    half_subtractor uut (
        .a(a),
        .b(b),
        .d(d),
        .b_out(b_out)
    );

    integer passed;
    integer failed;

initial begin
    a = 1'b0;
    b = 1'b0;
    passed = 0;
    failed = 0;

    $monitor("Time=%0t | a=%b, b=%b | d=%b, b_out=%b", $time, a, b, d, b_out);

    #10
    a = 1'b0; b = 1'b0;
    #1;
    if (d!==1'b0 || b_out!==1'b0) begin
        $display("Test case 00 failed: d=%b, b_out=%b", d, b_out);
        failed = failed + 1;
    end else begin
        $display("Test case 00 passed: d=%b, b_out=%b", d, b_out);
        passed = passed + 1;
    end

    #10
    a = 1'b0; b = 1'b1;
    #1;
    if (d!==1'b1 || b_out!==1'b1) begin
        $display("Test case 01 failed: d=%b, b_out=%b", d, b_out);
        failed = failed + 1;
    end else begin
        $display("Test case 01 passed: d=%b, b_out=%b", d, b_out);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b0; 
    #1;
    if (d!==1'b1 || b_out!==1'b0) begin
        $display("Test case 10 failed: d=%b, b_out=%b", d, b_out);
        failed = failed + 1;
    end else begin
        $display("Test case 10 passed: d=%b, b_out=%b", d, b_out);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b1; 
    #1;
    if (d!==1'b0 || b_out!==1'b0) begin
        $display("Test case 11 failed: d=%b, b_out=%b", d, b_out);
        failed = failed + 1;
    end else begin
        $display("Test case 11 passed: d=%b, b_out=%b", d, b_out);
        passed = passed + 1;
    end

    $display("Total Tests: %d", passed + failed);
    $display("Test Results: Passed=%d, Failed=%d", passed, failed);
    $finish;
end
endmodule