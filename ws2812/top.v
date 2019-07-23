/* Small test design for the WS2812 "Ear" on the iCEBreaker dev board. */

module top (
  input  CLK,
  output LED,   // User/boot LED next to power LED
  output USBPU  // USB pull-up resistor
);

  // drive USB pull-up resistor to '0' to disable USB
  assign USBPU = 0;

  localparam DIV = 25;

  reg [DIV - 1:0] counter = 0;

  always @(posedge CLK) begin
    counter <= counter + 1;
  end

  assign LED = counter[DIV-1:DIV-2];
endmodule
