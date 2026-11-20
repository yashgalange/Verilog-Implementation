module full_subtractor (
    input wire a,
    input wire b,
    input wire borrow_in,
    output wire diff,
    output wire borrow_out
);

assign diff = a ^ b ^ borrow_in;
assign borrow_out = (~a & b) | ((~a | b) & borrow_in);
    
endmodule