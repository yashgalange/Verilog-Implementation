module half_adder (
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);

assign sum = a ^ b; // XOR operation for sum
assign carry = a & b; // AND operation for carry

endmodule