module clock_time_alarm_controller(
  input clk,
  input reset,
  input [1:0] KeyCode,
  input KeyCodeAvailable,
  input [23:0] hhmmss,
  input [23:0] alarm_time,
  input alarm_time_enabled,
  input [1:0] mode,
  output reg [23:0] temp_time,
  output reg [23:0] new_time_hhmmss,
  output reg ld_timeofdayreg,
  output reg ld_alarmreg,
  output reg toggle_alarm,
  output reg clrBuffer
);

  // KeyCode Definitions
  localparam ENTER_BUTTON = 2'b01;
  localparam ESC_BUTTON = 2'b10;

  // Mode Definitions
  localparam DISPLAY_MODE = 2'b00;
  localparam SET_CLOCK_MODE = 2'b01;
  localparam SET_ALARM_MODE = 2'b10;

  // State to track the last processed mode
  reg [1:0] last_mode;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      last_mode <= DISPLAY_MODE;
      temp_time <= 24'b0;
      ld_timeofdayreg <= 1'b0;
      ld_alarmreg <= 1'b0;
      toggle_alarm <= 1'b0;
      clrBuffer <= 1'b0;
    end else begin
      // Reset temporary control signals
      ld_timeofdayreg <= 1'b0;
      ld_alarmreg <= 1'b0;
      clrBuffer <= 1'b0;

      // Handle mode transitions
      if (mode != last_mode) begin
        last_mode <= mode;
        case (mode)
          SET_CLOCK_MODE: temp_time <= 24'b0; // Initialize for setting clock
          SET_ALARM_MODE: temp_time <= alarm_time; // Initialize for setting alarm
          default: temp_time <= 24'b0; // Default to clear temp_time
        endcase
      end else begin
        // Handle input for the current mode
        case (mode)
          SET_CLOCK_MODE: begin
            if (KeyCodeAvailable) begin
              case (KeyCode)
                ENTER_BUTTON: begin
                  new_time_hhmmss <= temp_time; 
                  ld_timeofdayreg <= 1'b1;
                  clrBuffer <= 1'b1; // Clear buffer
                end
                ESC_BUTTON: begin
                  temp_time <= 24'b0;
                  clrBuffer <= 1'b1; // Clear buffer
                end
              endcase
            end else begin
              temp_time <= hhmmss; // Update temp_time
            end
          end

          SET_ALARM_MODE: begin
            if (KeyCodeAvailable) begin
              case (KeyCode)
                ENTER_BUTTON: begin
                  new_time_hhmmss <= temp_time; 
                  ld_alarmreg <= 1'b1; // Save alarm time
                  clrBuffer <= 1'b1; // Clear buffer
                end
                ESC_BUTTON: begin
                  temp_time <= 24'b0;
                  clrBuffer <= 1'b1; // Clear buffer
                end
              endcase
            end else begin
              temp_time <= hhmmss; // Update temp_time
            end
          end
        endcase
      end
    end
  end
endmodule