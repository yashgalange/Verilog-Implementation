module tb_not_gate;
    reg a;
    wire y;

    not_gate uut (
        .a(a),
        .y(y)
    );
integer passed_tests;
integer failed_tests;

initial begin
    passed_tests = 0;
    failed_tests = 0;

    $monitor("a=%b, y=%b", a, y);
    a = 1'b0;
    #1;
    if (y!==1'b1) begin
        $display("Test failed for a=0");
        failed_tests = failed_tests + 1;
    end
    else begin
        $display("Test passed for a=0");
        passed_tests = passed_tests + 1;
    end
    #10;
    a = 1'b1;
    #1;
    if (y!==1'b0) begin
        $display("Test failed for a=1");
        failed_tests = failed_tests + 1;
    end
    else begin
        $display("Test passed for a=1");
        passed_tests = passed_tests + 1;
    end
    #10;
    $display("Passed tests: %0d", passed_tests);
    $display("Failed tests: %0d", failed_tests);
    $display("Total tests: %0d", passed_tests + failed_tests);
    $finish;
end
endmodule