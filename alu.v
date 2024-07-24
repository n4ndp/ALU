module alu (
    input [31:0] a, b,
    input [1:0] ALUControl,
    output reg [31:0] Result,
    output wire [3:0] ALUFlags // 4-bit output for status flags (N, Z, C, V)
);

  wire negative, zero, carry, overflow; // Define wires for each flag
  wire [32:0] sum;                      // 33-bit wire for sum to capture the additional carry
  
  assign sum = a + (ALUControl[0] ? ~b : b) + ALUControl[0]; // Adder with two's complement for subtraction
  
  /*
  ALUControl Logic:
  00: addition (sum)
  01: subtraction (sub)
  10: logical AND
  11: logical OR
  */
  always @(*) begin
    casex (ALUControl[1:0])
      2'b0?: Result = sum[31:0]; // Addition or subtraction (the lower 32 bits of sum)
      2'b10: Result = a & b;     // Logical AND operation
      2'b11: Result = a | b;     // Logical OR operation
      default: Result = 32'b0;   // Default value for safety (although casex should handle all cases)
    endcase
  end
  
  assign negative = Result[31];
  assign zero = (Result == 32'b0);
  
  assign carry = (ALUControl[1] == 1'b0) & sum[32];
  assign overflow = (ALUControl[1] == 1'b0) & ~(a[31] ^ b[31] ^ ALUControl[0]) & (a[31] ^ sum[31]);

  assign ALUFlags = {negative, zero, carry, overflow};

endmodule
