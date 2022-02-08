module comparer2 #(
    parameter DATA_WIDTH = 8
)(clk,arstn,dinA,dinB,max,min);
input clk;
input arstn;
input [DATA_WIDTH-1:0]dinA;
input [DATA_WIDTH-1:0]dinB;
output [DATA_WIDTH-1:0]max;
output [DATA_WIDTH-1:0]min;
reg [DATA_WIDTH-1:0]max_reg;
reg [DATA_WIDTH-1:0]min_reg;

assign max = max_reg;
assign min = min_reg;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                max_reg <= 0;
                min_reg <= 0;
            end
        else
            begin
                if(dinA > dinB)
                    begin
                        max_reg <= dinA;
                        min_reg <= dinB;
                    end
                else
                    begin
                        max_reg <= dinB;
                        min_reg <= dinA;
                    end
            end
    end
endmodule
