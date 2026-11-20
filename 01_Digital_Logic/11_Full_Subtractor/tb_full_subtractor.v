`timescale 1ns/1ps

module tb_full_subtractor;

    reg a;
    reg b;
    reg borrow_in;
    wire diff;
    wire borrow_out;

    // Instantiate the full subtractor
    full_subtractor uut (
        .a(a),
        .b(b),
        .borrow_in(borrow_in),
        .diff(diff),
        .borrow_out(borrow_out)
    );
    integer passed_tests;
    integer failed_tests;

    initial begin
        passed_tests = 0;
        failed_tests = 0;
        a = 1'b0; b = 1'b0; borrow_in = 1'b0; 
        #10;       
        a = 1'b0; b = 1'b0; borrow_in = 1'b0; 
        #1;
        if(diff !== 1'b0 || borrow_out !== 1'b0) begin
            $display("Test failed for a=0, b=0, borrow_in=0: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b0; b = 1'b0; borrow_in = 1'b1;
        #1;
        if(diff !== 1'b1 || borrow_out !== 1'b1) begin
            $display("Test failed for a=0, b=0, borrow_in=1: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b0; b = 1'b1; borrow_in = 1'b0;
        #1;
        if(diff !== 1'b1 || borrow_out !== 1'b1) begin
            $display("Test failed for a=0, b=1, borrow_in=0: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b0; b = 1'b1; borrow_in = 1'b1;
        #1;
        if(diff !== 1'b0 || borrow_out !== 1'b1) begin
            $display("Test failed for a=0, b=1, borrow_in=1: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b1; b = 1'b0; borrow_in = 1'b0;
        #1;
        if(diff !== 1'b1 || borrow_out !== 1'b0) begin
            $display("Test failed for a=1, b=0, borrow_in=0: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b1; b = 1'b0; borrow_in = 1'b1;
        #1;
        if(diff !== 1'b0 || borrow_out !== 1'b0) begin
            $display("Test failed for a=1, b=0, borrow_in=1: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b1; b = 1'b1; borrow_in = 1'b0;
        #1;
        if(diff !== 1'b0 || borrow_out !== 1'b0) begin
            $display("Test failed for a=1, b=1, borrow_in=0: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        #10;
        a = 1'b1; b = 1'b1; borrow_in = 1'b1;
        #1;
        if(diff !== 1'b1 || borrow_out !== 1'b1) begin
            $display("Test failed for a=1, b=1, borrow_in=1: diff=%b, borrow_out=%b", diff, borrow_out);
            failed_tests = failed_tests + 1;
        end else begin
            passed_tests = passed_tests + 1;
        end

        $display("Simulation completed.");
        $display("Total Tests: %d", passed_tests + failed_tests);  
        $display("Total Passed Tests: %d", passed_tests);
        $display("Total Failed Tests: %d", failed_tests);
        $finish;
    end
endmodule