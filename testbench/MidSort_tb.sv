`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 05:25:19 PM
// Design Name: 
// Module Name: MidSort_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MidSort_tb;
parameter DATA_WIDTH = 8;
bit clk;
bit arstn;
bit din_valid;
bit [DATA_WIDTH-1:0]din00;
bit [DATA_WIDTH-1:0]din01;
bit [DATA_WIDTH-1:0]din02;
bit [DATA_WIDTH-1:0]din10;
bit [DATA_WIDTH-1:0]din11;
bit [DATA_WIDTH-1:0]din12;
bit [DATA_WIDTH-1:0]din20;
bit [DATA_WIDTH-1:0]din21;
bit [DATA_WIDTH-1:0]din22;
wire [DATA_WIDTH-1:0]dout_data;
wire dout_valid;
wire [DATA_WIDTH-1:0]out0;
wire [DATA_WIDTH-1:0]out1;
wire [DATA_WIDTH-1:0]out2;
wire [DATA_WIDTH-1:0]out3;
wire [DATA_WIDTH-1:0]out4;
wire [DATA_WIDTH-1:0]out5;
wire [DATA_WIDTH-1:0]out6;
wire [DATA_WIDTH-1:0]out7;
wire [DATA_WIDTH-1:0]out8;
integer i;
always #5 clk = ~clk;

initial
    begin
        arstn = 1'b1;
        din_valid = 1'b0;
        #20
        arstn = 1'b0;
        #20
        arstn = 1'b1;
        for(i=0;i<64;i=i+1)
            begin
                @(posedge clk);
                #2
                    din00 = $random()%256;
                    din01 = $random()%256;
                    din02 = $random()%256;
                    din10 = $random()%256;
                    din11 = $random()%256;
                    din12 = $random()%256;
                    din20 = $random()%256;
                    din21 = $random()%256;
                    din22 = $random()%256;
                    din_valid = 1'b1;
            end
        @(posedge clk);
        din_valid = 1'b0;
        #200 $finish;
    end

MidSort3x3 #(
    .DATA_WIDTH(DATA_WIDTH)
)DUT(clk,arstn,din00,din01,din02,din10,din11,din12,
    din20,din21,din22,din_valid,dout_data,dout_valid,out0,out1,out2,
    out3,out4,out5,out6,out7,out8);
endmodule
