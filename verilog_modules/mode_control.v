module mode_control(
  input clk, reset, mode_button,
  output reg [1:0] mode // 00: Display, 01: Set Clock, 10: Set Alarm
);
  always @(posedge clk or posedge reset) begin
    if (reset)
      mode <= 2'b00; // Reset to Display mode
    else if (mode_button) begin
      case (mode)
        2'b00: mode <= 2'b01; // From Display to Set Clock
        2'b01: mode <= 2'b10; // From Set Clock to Set Alarm
        2'b10: mode <= 2'b00; // From Set Alarm to Display
        default: mode <= 2'b00; // Default to Display mode (safe fallback)
      endcase
    end
  end
endmodule