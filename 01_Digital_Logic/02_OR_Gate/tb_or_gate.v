`timescale 1ns/1ps
module tb_or_gate;
    reg a;
    reg b;
    wire y;
    integer passed; 
    integer failed; 

or_gate uut (
    .a(a),
    .b(b),
    .y(y)
);

    initial begin
        $monitor("a=%b b=%b y=%b", a, b, y);
        passed = 0;
        failed = 0;

        a = 1'b0 ; b = 1'b0;
        #1
        if (y!== 1'b0) begin
            $display("Test Case 1 Failed");
            failed = failed + 1;
        end else begin
            $display("Test Case 1 Passed");
            passed = passed + 1;
        end

        #10 a = 1'b0 ; b = 1'b1;
        #1
        if (y!== 1'b1) begin
            $display("Test Case 2 Failed");
            failed = failed + 1;
        end else begin
            $display("Test Case 2 Passed");
            passed = passed + 1;
        end

        #10 a = 1'b1 ; b = 1'b0;
        #1
        if (y!== 1'b1) begin
            $display("Test Case 3 Failed");
            failed = failed + 1;
        end else begin
            $display("Test Case 3 Passed");
            passed = passed + 1;
        end   

        #10 a = 1'b1 ; b = 1'b1;
        #1
        if (y!== 1'b1) begin
            $display("Test Case 4 Failed");
            failed = failed + 1;
        end else begin
            $display("Test Case 4 Passed");
            passed = passed + 1;
        end   
        $display("Total Test Cases:%d, Passed:%d, Failed:%d",passed + failed,passed,failed);
        $finish;
    end
endmodule 