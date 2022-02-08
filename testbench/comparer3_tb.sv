`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 03:50:40 PM
// Design Name: 
// Module Name: comparer3_tb
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


module comparer3_tb;

parameter DATA_WIDTH = 8;
bit clk;
bit arstn;
bit [DATA_WIDTH-1:0]dinA;
bit [DATA_WIDTH-1:0]dinB;
bit [DATA_WIDTH-1:0]dinC;
wire [DATA_WIDTH-1:0]max;
wire [DATA_WIDTH-1:0]mid;
wire [DATA_WIDTH-1:0]min;
integer i;
always #5 clk = ~clk;
initial
    begin
        arstn = 1'b1;
        dinA = 0;
        dinB = 0;
        dinC = 0;
        #20
        arstn = 1'b0;
        #20
        arstn = 1'b1;
        for(i=0;i<64;i=i+1)
            begin
                @(posedge clk);
                #2
                dinA = $random()%256;
                dinB = $random()%256;
                dinC = $random()%256;
            end
       #200 $finish();
    end

comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)DUT(clk,arstn,dinA,dinB,dinC,max,mid,min);
endmodule
