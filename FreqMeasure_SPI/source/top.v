`timescale 1ns / 1ps
/*����˵��
MOSI �� P79
SCK �� P80
rst �� P83
CS �� P81
sig �� P82
*/
module top(clk,MOSI,CS,SCK,sigClk,rst,data,sclk,sendEnable,BUSY,Status
    );
input clk,sigClk,rst;
output MOSI,CS,SCK,sclk,sendEnable,BUSY;
output[7:0] data;
output [1:0] Status;
wire[7:0] data;
wire sclk,sendEnable,BUSY;

CLK_Module u1(
.clk(clk),
.sclk(sclk)
    );
Send_Module u2(
.clk(clk),
.sclk(sclk),
.riseSig(sendEnable),
.data(data),
.SCK(SCK),
.MOSI(MOSI),
.BUSY(BUSY),
.cs(CS),
.reset(rst)
    );
freqMeasure_Mod u3(
.baseClk(clk),
.sigClk(sigClk),
.data(data),
.sendEnable(sendEnable),
.sendBusy(BUSY),
.hard_Clr(rst),
.Status(Status)
    );
endmodule
