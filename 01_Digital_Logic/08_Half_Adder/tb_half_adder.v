`timescale 1ns / 1ps

module tb_half_adder;
    reg a;
    reg b;
    wire sum;
    wire carry;

    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

integer passed;
integer failed;

initial begin
    a = 1'b0;
    b = 1'b0;
    passed = 0;
    failed = 0;

    $monitor("Time=%0t | a=%b, b=%b | sum=%b, carry=%b", $time, a, b, sum, carry);

    #10
    a = 1'b0; b = 1'b0; 
    #1;
    if (sum!==1'b0 || carry!==1'b0) begin
        $display("Test case 00 failed: sum=%b, carry=%b", sum, carry);
        failed = failed + 1;
    end else begin
        $display("Test case 00 passed: sum=%b, carry=%b", sum, carry);
        passed = passed + 1;
    end

    #10
    a = 1'b0; b = 1'b1;
    #1;
    if (sum!==1'b1 || carry!==1'b0) begin
        $display("Test case 01 failed: sum=%b, carry=%b", sum, carry);
        failed = failed + 1;
    end else begin
        $display("Test case 01 passed: sum=%b, carry=%b", sum, carry);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b0;
    #1;
    if (sum!==1'b1 || carry!==1'b0) begin
        $display("Test case 10 failed: sum=%b, carry=%b", sum, carry);
        failed = failed + 1;
    end else begin
        $display("Test case 10 passed: sum=%b, carry=%b", sum, carry);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b1;
    #1;
    if (sum!==1'b0 || carry!==1'b1) begin
        $display("Test case 11 failed: sum=%b, carry=%b", sum, carry);
        failed = failed + 1;
    end else begin
        $display("Test case 11 passed: sum=%b, carry=%b", sum, carry);
        passed = passed + 1;
    end
    $display("Total tests: %0d", passed + failed);
    $display("Total passed: %0d, Total failed: %0d", passed, failed);
    $finish;

end

endmodule