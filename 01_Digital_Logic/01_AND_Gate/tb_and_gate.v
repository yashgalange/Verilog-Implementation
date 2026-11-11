module tb_and_gate;

reg a;
reg b;
wire y;

and_gate uut (
    .a(a),
    .b(b),
    .y(y)
);

integer pass_count;
integer fail_count;

initial begin
    $monitor("a=%b b=%b y=%b", a, b, y);
    pass_count = 0;
    fail_count = 0;

    a = 1'b0; b = 1'b0;
    #1;
    if (y !== 1'b0) begin 
        $display("Test failed for a=0, b=0");
        fail_count = fail_count + 1;
    end
    else begin
        $display("Test passed for a=0, b=0");
        pass_count = pass_count + 1;
    end

    #10 a = 1'b0; b = 1'b1;
    #1;
    if (y !== 1'b0) begin 
        $display("Test failed for a=0, b=1");
        fail_count = fail_count + 1;
    end
    else begin
        $display("Test passed for a=0, b=1");
        pass_count = pass_count + 1;
    end

    #10 a = 1'b1; b = 1'b0;
    #1;
    if (y !== 1'b0) begin 
        $display("Test failed for a=1, b=0");
        fail_count = fail_count + 1;
    end
    else begin
        $display("Test passed for a=1, b=0");
        pass_count = pass_count + 1;
    end
    
    #10 a = 1'b1; b = 1'b1;
    #1;
    if (y !== 1'b1) begin
        $display("Test failed for a=1, b=1");
        fail_count = fail_count + 1;
    end
    else begin
        $display("Test passed for a=1, b=1");
        pass_count = pass_count + 1;
    end
    $display("Total tests = %0d", pass_count + fail_count);
    $display("Passed = %0d", pass_count);
    $display("Failed = %0d", fail_count);
    $finish;
end

endmodule