`timescale 1ns / 1ps

module tb_full_adder;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

integer passed;
integer failed;

initial begin
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    passed = 0;
    failed = 0;

    $monitor("Time=%0t | a=%b, b=%b, cin=%b | sum=%b, cout=%b", $time, a, b, cin, sum, cout);

    #10
    a = 1'b0; b = 1'b0; cin = 1'b0;
    #1;
    if (sum!==1'b0 || cout!==1'b0) begin
        $display("Test case 000 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 000 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b0; b = 1'b0; cin = 1'b1;
    #1;
    if (sum!==1'b1 || cout!==1'b0) begin
        $display("Test case 001 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 001 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b0; b = 1'b1; cin = 1'b0;
    #1;
    if (sum!==1'b1 || cout!==1'b0) begin
        $display("Test case 010 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 010 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b0; b = 1'b1; cin = 1'b1;
    #1;
    if (sum!==1'b0 || cout!==1'b1) begin
        $display("Test case 011 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 011 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b0; cin = 1'b0;
    #1;
    if (sum!==1'b1 || cout!==1'b0) begin
        $display("Test case 100 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 100 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b0; cin = 1'b1;
    #1;
    if (sum!==1'b0 || cout!==1'b1) begin
        $display("Test case 101 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 101 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b1; cin = 1'b0;
    #1;
    if (sum!==1'b0 || cout!==1'b1) begin
        $display("Test case 110 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 110 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    #10
    a = 1'b1; b = 1'b1; cin = 1'b1;
    #1;
    if (sum!==1'b1 || cout!==1'b1) begin
        $display("Test case 111 failed: sum=%b, cout=%b", sum, cout);
        failed = failed + 1;
    end else begin
        $display("Test case 111 passed: sum=%b, cout=%b", sum, cout);
        passed = passed + 1;
    end

    $display("Total Tests: %0d", passed + failed);
    $display("Total Passed: %0d, Total Failed: %0d", passed, failed);
    $finish;
end    
endmodule