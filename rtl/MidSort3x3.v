module MidSort3x3 #(
    parameter DATA_WIDTH = 8
)(clk,arstn,din00,din01,din02,din10,din11,din12,
    din20,din21,din22,din_valid,dout_data,dout_valid,out0,out1,out2,
    out3,out4,out5,out6,out7,out8);

input clk;
input arstn;
input din_valid;
input [DATA_WIDTH-1:0]din00;
input [DATA_WIDTH-1:0]din01;
input [DATA_WIDTH-1:0]din02;
input [DATA_WIDTH-1:0]din10;
input [DATA_WIDTH-1:0]din11;
input [DATA_WIDTH-1:0]din12;
input [DATA_WIDTH-1:0]din20;
input [DATA_WIDTH-1:0]din21;
input [DATA_WIDTH-1:0]din22;
output [DATA_WIDTH-1:0]dout_data;
output dout_valid;
output [DATA_WIDTH-1:0]out0;
output [DATA_WIDTH-1:0]out1;
output [DATA_WIDTH-1:0]out2;
output [DATA_WIDTH-1:0]out3;
output [DATA_WIDTH-1:0]out4;
output [DATA_WIDTH-1:0]out5;
output [DATA_WIDTH-1:0]out6;
output [DATA_WIDTH-1:0]out7;
output [DATA_WIDTH-1:0]out8;
reg dvalid_delay0;
reg dvalid_delay1;
reg dvalid_delay2;
reg dvalid_delay3;
reg dvalid_delay4;
reg dvalid_delay5;
reg dvalid_delay6;
reg dvalid_delay7;
reg dvalid_delay8;
reg dvalid_delay9;
reg dvalid_delay10;
reg dvalid_delay11;
reg dvalid_delay12;
reg dvalid_delay13;
reg dvalid_delay14;
reg dvalid_delay15;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                dvalid_delay0<=0;
                dvalid_delay1<=0;
                dvalid_delay2<=0;
                dvalid_delay3<=0;
                dvalid_delay4<=0;
                dvalid_delay5<=0;
                dvalid_delay6<=0;
                dvalid_delay7<=0;
                dvalid_delay8<=0;
                dvalid_delay9<=0;
                dvalid_delay10<=0;
                dvalid_delay11<=0;
                dvalid_delay12<=0;
                dvalid_delay13<=0;
                dvalid_delay14<=0;
                dvalid_delay15<=0;
            end
        else
            begin
                dvalid_delay0<=din_valid;
                dvalid_delay1<=dvalid_delay0;
                dvalid_delay2<=dvalid_delay1;
                dvalid_delay3<=dvalid_delay2;
                dvalid_delay4<=dvalid_delay3;
                dvalid_delay5<=dvalid_delay4;
                dvalid_delay6<=dvalid_delay5;
                dvalid_delay7<=dvalid_delay6;
                dvalid_delay8<=dvalid_delay7;
                dvalid_delay9<=dvalid_delay8;
                dvalid_delay10<=dvalid_delay9;
                dvalid_delay11<=dvalid_delay10;
                dvalid_delay12<=dvalid_delay11;
                dvalid_delay13<=dvalid_delay12;
                dvalid_delay14<=dvalid_delay13;
                dvalid_delay15<=dvalid_delay14;                
            end
    end
assign dout_valid = dvalid_delay15;
assign dout_data = out4;
/* the first compare pipe */
wire [DATA_WIDTH-1:0]level00_max;
wire [DATA_WIDTH-1:0]level00_mid;
wire [DATA_WIDTH-1:0]level00_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level00(
    .clk(clk),
    .arstn(arstn),
    .dinA(din00),
    .dinB(din01),
    .dinC(din02),
    .max(level00_max),
    .mid(level00_mid),
    .min(level00_min));

wire [DATA_WIDTH-1:0]level01_max;
wire [DATA_WIDTH-1:0]level01_mid;
wire [DATA_WIDTH-1:0]level01_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level01(
    .clk(clk),
    .arstn(arstn),
    .dinA(din10),
    .dinB(din11),
    .dinC(din12),
    .max(level01_max),
    .mid(level01_mid),
    .min(level01_min));
    
wire [DATA_WIDTH-1:0]level02_max;
wire [DATA_WIDTH-1:0]level02_mid;
wire [DATA_WIDTH-1:0]level02_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level02(
    .clk(clk),
    .arstn(arstn),
    .dinA(din20),
    .dinB(din21),
    .dinC(din22),
    .max(level02_max),
    .mid(level02_mid),
    .min(level02_min));
    
/* The second compare pipe */
wire [DATA_WIDTH-1:0]level10_max;
wire [DATA_WIDTH-1:0]level10_mid;
wire [DATA_WIDTH-1:0]level10_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level10(
    .clk(clk),
    .arstn(arstn),
    .dinA(level00_max),
    .dinB(level01_max),
    .dinC(level02_max),
    .max(level10_max),
    .mid(level10_mid),
    .min(level10_min));

wire [DATA_WIDTH-1:0]level11_max;
wire [DATA_WIDTH-1:0]level11_mid;
wire [DATA_WIDTH-1:0]level11_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level11(
    .clk(clk),
    .arstn(arstn),
    .dinA(level00_mid),
    .dinB(level01_mid),
    .dinC(level02_mid),
    .max(level11_max),
    .mid(level11_mid),
    .min(level11_min));

wire [DATA_WIDTH-1:0]level12_max;
wire [DATA_WIDTH-1:0]level12_mid;
wire [DATA_WIDTH-1:0]level12_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level12(
    .clk(clk),
    .arstn(arstn),
    .dinA(level00_min),
    .dinB(level01_min),
    .dinC(level02_min),
    .max(level12_max),
    .mid(level12_mid),
    .min(level12_min));
    
/* The third compare pipe */
wire [DATA_WIDTH-1:0]level20_max;
wire [DATA_WIDTH-1:0]level20_mid;
wire [DATA_WIDTH-1:0]level20_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level20(
    .clk(clk),
    .arstn(arstn),
    .dinA(level10_mid),
    .dinB(level11_max),
    .dinC(level12_max),
    .max(level20_max),
    .mid(level20_mid),
    .min(level20_min));

reg [DATA_WIDTH-1:0]out1_level2_delay_0;
reg [DATA_WIDTH-1:0]out1_level2_delay_1;
reg [DATA_WIDTH-1:0]out1_level2_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out1_level2_delay_0 <= 0;
                out1_level2_delay_1 <= 0;
                out1_level2_delay_2 <= 0;
            end
        else
            begin
                out1_level2_delay_0 <= level10_max;
                out1_level2_delay_1 <= out1_level2_delay_0;
                out1_level2_delay_2 <= out1_level2_delay_1;
            end
    end

reg [DATA_WIDTH-1:0]level11_mid_delay21_0;
reg [DATA_WIDTH-1:0]level11_mid_delay21_1;
reg [DATA_WIDTH-1:0]level11_mid_delay21_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                level11_mid_delay21_0 <= 0;
                level11_mid_delay21_1 <= 0;
                level11_mid_delay21_2 <= 0;
            end
        else
            begin
                level11_mid_delay21_0 <= level11_mid;
                level11_mid_delay21_1 <= level11_mid_delay21_0;
                level11_mid_delay21_2 <= level11_mid_delay21_1;
            end
    end

wire [DATA_WIDTH-1:0]level22_max;
wire [DATA_WIDTH-1:0]level22_mid;
wire [DATA_WIDTH-1:0]level22_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_level22(
    .clk(clk),
    .arstn(arstn),
    .dinA(level10_min),
    .dinB(level11_min),
    .dinC(level12_mid),
    .max(level22_max),
    .mid(level22_mid),
    .min(level22_min));

reg [DATA_WIDTH-1:0]out9_level2_delay_0;
reg [DATA_WIDTH-1:0]out9_level2_delay_1;
reg [DATA_WIDTH-1:0]out9_level2_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out9_level2_delay_0 <= 0;
                out9_level2_delay_1 <= 0;
                out9_level2_delay_2 <= 0;
            end
        else
            begin
                out9_level2_delay_0 <= level12_min;
                out9_level2_delay_1 <= out9_level2_delay_0;
                out9_level2_delay_2 <= out9_level2_delay_1;
            end
    end    

/* The Fourth compare pipe */
wire [DATA_WIDTH-1:0]level30_max;
wire [DATA_WIDTH-1:0]level30_min;
comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare30(
    .clk(clk),
    .arstn(arstn),
    .dinA(level20_mid),
    .dinB(level20_min),
    .max(level30_max),
    .min(level30_min)
);

reg [DATA_WIDTH-1:0]level30_max_delay0;
reg [DATA_WIDTH-1:0]level30_max_delay1;
reg [DATA_WIDTH-1:0]level30_min_delay0;
reg [DATA_WIDTH-1:0]level30_min_delay1;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                level30_max_delay0 <= 0;
                level30_max_delay1 <= 0;
                level30_min_delay0 <= 0;
                level30_min_delay1 <= 0;
            end
        else
            begin
                level30_max_delay0 <= level30_max;
                level30_max_delay1 <= level30_max_delay0;
                level30_min_delay0 <= level30_min;
                level30_min_delay1 <= level30_min_delay0;
            end
    end

reg [DATA_WIDTH-1:0]out1_level3_delay_0;
reg [DATA_WIDTH-1:0]out1_level3_delay_1;
reg [DATA_WIDTH-1:0]out1_level3_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out1_level3_delay_0 <= 0;
                out1_level3_delay_1 <= 0;
                out1_level3_delay_2 <= 0;
            end
        else
            begin
                out1_level3_delay_0 <= out1_level2_delay_2;
                out1_level3_delay_1 <= out1_level3_delay_0;
                out1_level3_delay_2 <= out1_level3_delay_1;
            end
    end

reg [DATA_WIDTH-1:0]out2_level3_delay_0;
reg [DATA_WIDTH-1:0]out2_level3_delay_1;
reg [DATA_WIDTH-1:0]out2_level3_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out2_level3_delay_0 <= 0;
                out2_level3_delay_1 <= 0;
                out2_level3_delay_2 <= 0;
            end
        else
            begin
                out2_level3_delay_0 <= level20_max;
                out2_level3_delay_1 <= out2_level3_delay_0;
                out2_level3_delay_2 <= out2_level3_delay_1;
            end
    end

wire [DATA_WIDTH-1:0]level31_max;
wire [DATA_WIDTH-1:0]level31_mid;
wire [DATA_WIDTH-1:0]level31_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare31(
    .clk(clk),
    .arstn(arstn),
    .dinA(level11_mid_delay21_2),
    .dinB(level22_max),
    .dinC(level22_mid),
    .max(level31_max),
    .mid(level31_mid),
    .min(level31_min)
);

reg [DATA_WIDTH-1:0]out9_level3_delay_0;
reg [DATA_WIDTH-1:0]out9_level3_delay_1;
reg [DATA_WIDTH-1:0]out9_level3_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out9_level3_delay_0 <= 0;
                out9_level3_delay_1 <= 0;
                out9_level3_delay_2 <= 0;
            end
        else
            begin
                out9_level3_delay_0 <= out9_level2_delay_2;
                out9_level3_delay_1 <= out9_level3_delay_0;
                out9_level3_delay_2 <= out9_level3_delay_1;
            end
    end

reg [DATA_WIDTH-1:0]out8_level3_delay_0;
reg [DATA_WIDTH-1:0]out8_level3_delay_1;
reg [DATA_WIDTH-1:0]out8_level3_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out8_level3_delay_0 <= 0;
                out8_level3_delay_1 <= 0;
                out8_level3_delay_2 <= 0;
            end
        else
            begin
                out8_level3_delay_0 <= level22_min;
                out8_level3_delay_1 <= out8_level3_delay_0;
                out8_level3_delay_2 <= out8_level3_delay_1;
            end
    end
    
/* The fifth compare pipe */
wire [DATA_WIDTH-1:0]level40_max;
wire [DATA_WIDTH-1:0]level40_min;
comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare40(
    .clk(clk),
    .arstn(arstn),
    .dinA(level30_max_delay1),
    .dinB(level31_max),
    .max(level40_max),
    .min(level40_min)
);

reg [DATA_WIDTH-1:0]out1_level4_delay_0;
//reg [DATA_WIDTH-1:0]out1_level4_delay_1;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out1_level4_delay_0 <= 0;
                //out1_level4_delay_1 <= 0;
            end
        else
            begin
                out1_level4_delay_0 <= out1_level3_delay_2;
                //out1_level4_delay_1 <= out1_level4_delay_0;
            end
    end

reg [DATA_WIDTH-1:0]out2_level4_delay_0;
//reg [DATA_WIDTH-1:0]out2_level4_delay_1;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out2_level4_delay_0 <= 0;
                //out2_level4_delay_1 <= 0;
            end
        else
            begin
                out2_level4_delay_0 <= out2_level3_delay_2;
               // out2_level4_delay_1 <= out2_level4_delay_0;
            end
    end

reg [DATA_WIDTH-1:0]level31_mid_delay41_0;
//reg [DATA_WIDTH-1:0]level31_mid_delay41_1;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                level31_mid_delay41_0 <= 0;
                //level31_mid_delay41_1 <= 0;
            end
        else
            begin
                level31_mid_delay41_0 <= level31_mid;
                //level31_mid_delay41_1 <= level31_mid_delay41_0;
            end
    end


wire [DATA_WIDTH-1:0]level42_max;
wire [DATA_WIDTH-1:0]level42_min;
comparer2 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare42(
    .clk(clk),
    .arstn(arstn),
    .dinA(level30_min_delay1),
    .dinB(level31_min),
    .max(level42_max),
    .min(level42_min)
);

reg [DATA_WIDTH-1:0]out9_level4_delay_0;
//reg [DATA_WIDTH-1:0]out9_level4_delay_1;

always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out9_level4_delay_0 <= 0;
               // out9_level4_delay_1 <= 0;
            end
        else
            begin
                out9_level4_delay_0 <= out9_level3_delay_2;
               // out9_level4_delay_1 <= out9_level4_delay_0;
            end
    end

reg [DATA_WIDTH-1:0]out8_level4_delay_0;
//reg [DATA_WIDTH-1:0]out8_level4_delay_1;

always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out8_level4_delay_0 <= 0;
               // out8_level4_delay_1 <= 0;
            end
        else
            begin
                out8_level4_delay_0 <= out8_level3_delay_2;
                //out8_level4_delay_1 <= out8_level4_delay_0;
            end
    end

/* The sixth compare pipe */
wire [DATA_WIDTH-1:0]level50_max;
wire [DATA_WIDTH-1:0]level50_mid;
wire [DATA_WIDTH-1:0]level50_min;
comparer3 #(
    .DATA_WIDTH(DATA_WIDTH)
)Inst_compare50(
    .clk(clk),
    .arstn(arstn),
    .dinA(level40_min),
    .dinB(level31_mid_delay41_0),
    .dinC(level42_max),
    .max(level50_max),
    .mid(level50_mid),
    .min(level50_min)
);

assign out3 = level50_max;
assign out4 = level50_mid;
assign out5 = level50_min;

reg [DATA_WIDTH-1:0]out1_level5_delay_0;
reg [DATA_WIDTH-1:0]out1_level5_delay_1;
reg [DATA_WIDTH-1:0]out1_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out1_level5_delay_0 <= 0;
                out1_level5_delay_1 <= 0;
                out1_level5_delay_2 <= 0;
            end
        else
            begin
                out1_level5_delay_0 <= out1_level4_delay_0;
                out1_level5_delay_1 <= out1_level5_delay_0;
                out1_level5_delay_2 <= out1_level5_delay_1;
            end
    end

reg [DATA_WIDTH-1:0]out2_level5_delay_0;
reg [DATA_WIDTH-1:0]out2_level5_delay_1;
reg [DATA_WIDTH-1:0]out2_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out2_level5_delay_0 <= 0;
                out2_level5_delay_1 <= 0;
                out2_level5_delay_2 <= 0;
            end
        else
            begin
                out2_level5_delay_0 <= out2_level4_delay_0;
                out2_level5_delay_1 <= out2_level5_delay_0;
                out2_level5_delay_2 <= out2_level5_delay_1;
            end
    end
assign out0 = out1_level5_delay_2;
assign out1 = out2_level5_delay_2;

reg [DATA_WIDTH-1:0]out3_level5_delay_0;
reg [DATA_WIDTH-1:0]out3_level5_delay_1;
reg [DATA_WIDTH-1:0]out3_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out3_level5_delay_0 <= 0;
                out3_level5_delay_1 <= 0;
                out3_level5_delay_2 <= 0;
            end
        else
            begin
                out3_level5_delay_0 <= level40_max;
                out3_level5_delay_1 <= out3_level5_delay_0;
                out3_level5_delay_2 <= out3_level5_delay_1;
            end
    end
assign out2 = out3_level5_delay_2;

reg [DATA_WIDTH-1:0]out7_level5_delay_0;
reg [DATA_WIDTH-1:0]out7_level5_delay_1;
reg [DATA_WIDTH-1:0]out7_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out7_level5_delay_0 <= 0;
                out7_level5_delay_1 <= 0;
                out7_level5_delay_2 <= 0;
            end
        else
            begin
                out7_level5_delay_0 <= level42_min;
                out7_level5_delay_1 <= out7_level5_delay_0;
                out7_level5_delay_2 <= out7_level5_delay_1;
            end
    end
assign out6 = out7_level5_delay_2;

reg [DATA_WIDTH-1:0]out8_level5_delay_0;
reg [DATA_WIDTH-1:0]out8_level5_delay_1;
reg [DATA_WIDTH-1:0]out8_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out8_level5_delay_0 <= 0;
                out8_level5_delay_1 <= 0;
                out8_level5_delay_2 <= 0;
            end
        else
            begin
                out8_level5_delay_0 <= out8_level4_delay_0;
                out8_level5_delay_1 <= out8_level5_delay_0;
                out8_level5_delay_2 <= out8_level5_delay_1;
            end
    end
assign out7 = out8_level5_delay_2;

reg [DATA_WIDTH-1:0]out9_level5_delay_0;
reg [DATA_WIDTH-1:0]out9_level5_delay_1;
reg [DATA_WIDTH-1:0]out9_level5_delay_2;
always@(posedge clk or negedge arstn)
    begin
        if(~arstn)
            begin
                out9_level5_delay_0 <= 0;
                out9_level5_delay_1 <= 0;
                out9_level5_delay_2 <= 0;
            end
        else
            begin
                out9_level5_delay_0 <= out9_level4_delay_0;
                out9_level5_delay_1 <= out9_level5_delay_0;
                out9_level5_delay_2 <= out9_level5_delay_1;
            end
    end
assign out8 = out9_level5_delay_2;
endmodule


















