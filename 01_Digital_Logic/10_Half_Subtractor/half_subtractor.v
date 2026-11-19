module half_subtractor(
    input a,
    input b,
    output d,
    output b_out
);
    assign d = a ^ b; // Difference
    assign b_out = ~a & b; // Borrow out
    
endmodule