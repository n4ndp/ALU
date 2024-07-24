module alu_tb;
  reg [31:0] a, b;            // Registers for operands
  reg [1:0] ALUControl;       // Register for control signal
  wire [31:0] Result;         // Wire for the ALU result
  wire [3:0] ALUFlags;        // Wire for the ALU status flags

  alu uut (
    .a(a),
    .b(b),
    .ALUControl(ALUControl),
    .Result(Result),
    .ALUFlags(ALUFlags)
  );

  initial begin
    // Test case: addition
    a = 32'd10; b = 32'd5; ALUControl = 2'b00;
    #10;
    $display("Addition: Result = %d, Flags = %b", Result, ALUFlags);

    // Test case: subtraction
    a = 32'd10; b = 32'd5; ALUControl = 2'b01;
    #10;
    $display("Subtraction: Result = %d, Flags = %b", Result, ALUFlags);

    // Test case: AND
    a = 32'hFF00FF00; b = 32'h0F0F0F0F; ALUControl = 2'b10;
    #10;
    $display("AND: Result = %h, Flags = %b", Result, ALUFlags);

    // Test case: OR
    a = 32'hFF00FF00; b = 32'h0F0F0F0F; ALUControl = 2'b11;
    #10;
    $display("OR: Result = %h, Flags = %b", Result, ALUFlags);

    $finish;
  end
endmodule
