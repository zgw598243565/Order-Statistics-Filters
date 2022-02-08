module comparer3 #(
    parameter DATA_WIDTH = 8
)(clk,arstn,dinA,dinB,dinC,max,mid,min);
input clk;
input arstn;
input [DATA_WIDTH-1:0]dinA;
input [DATA_WIDTH-1:0]dinB;
input [DATA_WIDTH-1:0]dinC;
output [DATA_WIDTH-1:0]max;
output [DATA_WIDTH-1:0]mid;
output [DATA_WIDTH-1:0]min;

reg [DATA_WIDTH-1:0]dinc_delay;

always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            dinc_delay <= 0;
        else
            dinc_delay <= dinC;
    end

wire [DATA_WIDTH-1:0]first_max;
wire [DATA_WIDTH-1:0]first_min;
reg [DATA_WIDTH-1:0]first_min_delay;

always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            first_min_delay <= 0;
        else
            first_min_delay <= first_min;
    end
comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare2_first(
    .clk(clk),
    .arstn(arstn),
    .dinA(dinA),
    .dinB(dinB),
    .max(first_max),
    .min(first_min)
);

wire [DATA_WIDTH-1:0]second_max;
wire [DATA_WIDTH-1:0]second_min;
reg [DATA_WIDTH-1:0]max_reg;

always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            max_reg <= 0;
        else
            max_reg <= second_max;
    end

assign max = max_reg;

comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare2_second(
    .clk(clk),
    .arstn(arstn),
    .dinA(dinc_delay),
    .dinB(first_max),
    .max(second_max),
    .min(second_min)
);

comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare2_third(
    .clk(clk),
    .arstn(arstn),
    .dinA(second_min),
    .dinB(first_min_delay),
    .max(mid),
    .min(min)
);
endmodule














