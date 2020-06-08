`timescale 1ns / 1ps

module weight_imag_lookup(output reg [15:0] weight_imag, input [1:0] theta, input [2:0] n);
    always @(*) begin
        case({theta,n})
            5'b00000: weight_imag = 16'h0000;
            5'b00001: weight_imag <= 16'hdd64;
            5'b00010: weight_imag <= 16'hbd5b;
            5'b00011: weight_imag <= 16'ha24a;            
            5'b00100: weight_imag <= 16'h8e34;            
            5'b00101: weight_imag <= 16'h8299;
            5'b00110: weight_imag <= 16'h8055;
            5'b00111: weight_imag <= 16'h8794;

            5'b01000: weight_imag <= 16'h0000;
            5'b01001: weight_imag <= 16'h83c4;
            5'b01010: weight_imag <= 16'hc430;
            5'b01011: weight_imag <= 16'h5f71;            
            5'b01100: weight_imag <= 16'h69c2;            
            5'b01101: weight_imag <= 16'hd379;
            5'b01110: weight_imag <= 16'h80ce;
            5'b01111: weight_imag <= 16'hef4a;            

            5'b10000: weight_imag <= 16'h0000;
            5'b10001: weight_imag <= 16'h9a27;
            5'b10010: weight_imag <= 16'h7b61;
            5'b10011: weight_imag <= 16'hd063;            
            5'b10100: weight_imag <= 16'hbe4d;            
            5'b10101: weight_imag <= 16'h7f34;
            5'b10110: weight_imag <= 16'ha79b;
            5'b10111: weight_imag <= 16'hebe0;            

            5'b11000: weight_imag <= 16'h0000;
            5'b11001: weight_imag <= 16'hdade;
            5'b11010: weight_imag <= 16'h4713;
            5'b11011: weight_imag <= 16'h9d19;            
            5'b11100: weight_imag <= 16'h7639;            
            5'b11101: weight_imag <= 16'h80a1;
            5'b11110: weight_imag <= 16'h7d91;
            5'b11111: weight_imag <= 16'h8f0a;
            default: weight_imag <= 16'b0;
        endcase
    end
endmodule

module weight_real_lookup(output reg [15:0] weight_real, input [1:0] theta, input [2:0] n);    
    always @(*) begin
        case({theta,n})
            5'b00000: weight_real <= 16'h7fff;
            5'b00001: weight_real <= 16'h7b3b;
            5'b00010: weight_real <= 16'h6d48;
            5'b00011: weight_real <= 16'h5731;            
            5'b00100: weight_real <= 16'h3a9b;            
            5'b00101: weight_real <= 16'h19a6;
            5'b00110: weight_real <= 16'hf6c9;
            5'b00111: weight_real <= 16'hd49b;

            5'b01000: weight_real <= 16'h7fff;
            5'b01001: weight_real <= 16'h1ed0;
            5'b01010: weight_real <= 16'h8ed5;
            5'b01011: weight_real <= 16'haab5;            
            5'b01100: weight_real <= 16'h48ab;            
            5'b01101: weight_real <= 16'h7802;
            5'b01110: weight_real <= 16'hf1ac;
            5'b01111: weight_real <= 16'h8118;            

            5'b10000: weight_real <= 16'h7fff;
            5'b10001: weight_real <= 16'hb278;
            5'b10010: weight_real <= 16'hddeb;
            5'b10011: weight_real <= 16'h76d1;            
            5'b10100: weight_real <= 16'h9226;            
            5'b10101: weight_real <= 16'h0e42;
            5'b10110: weight_real <= 16'h5c94;
            5'b10111: weight_real <= 16'h8198;            

            5'b11000: weight_real <= 16'h7fff;
            5'b11001: weight_real <= 16'h8581;
            5'b11010: weight_real <= 16'h6a74;
            5'b11011: weight_real <= 16'haebe;            
            5'b11100: weight_real <= 16'h3112;            
            5'b11101: weight_real <= 16'hf357;
            5'b11110: weight_real <= 16'he72a;
            5'b11111: weight_real <= 16'h3c32;
            default: weight_real <= 16'b0;
        endcase
    end
endmodule


module complexMult(input clk, input reset, input [31:0] complexIn, output [63:0] complexOut, input [1:0] theta, input [2:0] n);
    reg signed [31:0] imag_part, real_part;
    wire signed [15:0] a, b;
    wire signed [15:0] c, d;
    
    assign {b,a} = complexIn;    
    weight_imag_lookup wil(.weight_imag(d), .theta(theta), .n(n));
    weight_real_lookup wrl(.weight_real(c), .theta(theta), .n(n));
    
    always@(posedge clk) begin
        if(reset) begin
            real_part <= 0;
            imag_part <= 0;
        end
        else begin
            real_part <= a*c - b*d; // 32 bit
            imag_part <= a*d + b*c; // 32 bit
        end
    end
    assign complexOut = {imag_part, real_part}; // 64 bit
endmodule


module w_tx(input clk, input resetn,
    input [31:0] w_tx_din_0,
    input [31:0] w_tx_din_1,
    input [31:0] w_tx_din_2,
    input [31:0] w_tx_din_3,
    output [511:0] w_tx_out_0, 
    output [511:0] w_tx_out_1, 
    output [511:0] w_tx_out_2, 
    output [511:0] w_tx_out_3,
    input fifo_empty,
    output reg fifo_rd_en,
    output reg FMC_valid,
    output reg FMC_isIM,
    input FMC_ready);

    reg processing;
    reg processing_buffer;

    always@(posedge clk) begin
        if(!resetn) begin
            fifo_rd_en <= 1'b0;
            FMC_valid <= 1'b0;
            FMC_isIM <= 1'b0;
        end
        else begin
            if(FMC_ready && !fifo_empty && !processing) begin // fifo is filled with data after IFFT and RX is ready to receive data
                fifo_rd_en <= 1'b1;
                FMC_valid <= 1'b0;
                FMC_isIM <= 1'b0;
                processing <= 1'b1;
                processing_buffer <= 1'b1;
            end
            else if(processing_buffer) begin // fifo_rd_en is asserted, but data hasn't arrived yet
                fifo_rd_en <= 1'b0; // asserted for 1 clock cycle
                FMC_valid <= 1'b0;
                FMC_isIM <= 1'b0;
                processing <= 1'b1;
                processing_buffer <= 1'b0;
            end
            else if(processing) begin
//                fifo_rd_en <= 1'b0; // conservative version
                FMC_valid <= 1'b1;
                if(!FMC_isIM) begin
                    FMC_isIM <= 1'b1;
                    fifo_rd_en <= 1'b0;
                    processing <= 1'b1;
                    processing_buffer <= 1'b0;
                end
                else begin
                    FMC_isIM <= 1'b0;
//                    if(FMC_ready && !fifo_empty) begin
//                        fifo_rd_en <= 1'b1;
//                        processing <= 1'b1;
//                        processing_buffer <= 1'b1;
//                    end
//                    else begin
//                        fifo_rd_en <= 1'b0;
//                        processing <= 1'b0;
//                        processing_buffer <= 1'b0;
//                    end
                    processing <= 1'b0; // conservative version
                end
                processing_buffer <= 1'b0; // conservative version
            end
            else begin // idle state
                fifo_rd_en <= 1'b0;
                FMC_valid <= 1'b0;
                FMC_isIM <= 1'b0;
                processing_buffer <= 1'b0;
                processing <= 1'b0;
            end
        end
    end

//    reg processing;
//    reg processing_buffer;
//    reg [2:0] counter;
    
//    always@(posedge clk) begin
//        if(reset) begin
//            fifo_rd_en <= 1'b0;
//            FMC_output <= 32'b0;
//            FMC_valid <= 1'b0;
//            FMC_isIM <= 1'b0;
//            processing <= 1'b0;
//            processing_buffer <= 1'b0;
//            counter <= 3'b000;
//        end
//        else begin
//            if(FMC_ready && !fifo_empty && !processing) begin // fifo is filled with data after IFFT and RX is ready to receive data
//                fifo_rd_en <= 1'b1;
//                processing <= 1'b1;
//                processing_buffer <= 1'b1;
//            end
//            else if(processing_buffer) begin // fifo_rd_en is asserted, but data hasn't arrived yet
//                fifo_rd_en <= 1'b0; // asserted for 1 clock cycle
//                processing_buffer <= 1'b0;
//            end
//            else begin
//                if(counter==3'b000) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[511:480];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[479:448];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end
//                else if(counter==3'b001) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[447:416];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[415:384];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end
//                 else if(counter==3'b010) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[383:352];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[351:320];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end
//                else if(counter==3'b011) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[319:288];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[287:256];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end
//                else if(counter==3'b100) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[255:224];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[223:192];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end
//                else if(counter==3'b101) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[191:160];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[159:128];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end               
//                else if(counter==3'b110) begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[127:96];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[95:64];
//                        FMC_isIM <= 1'b0;
//                        counter <= counter + 3'b001;
//                    end
//                end                
//                else begin
//                    if(!FMC_isIM) begin
//                        FMC_output <= w_tx_sum[63:32];
//                        FMC_isIM <= 1'b1;
//                    end
//                    else begin
//                        FMC_output <= w_tx_sum[31:0];
//                        FMC_isIM <= 1'b0;
//                        counter <= 3'b000;
//                        processing <= 1'b0;
//                    end
//                end                
//            end
//        end
//    end

//    wire [511:0] w_tx_sum;
 //   wire [511:0] w_tx_out_0, w_tx_out_1, w_tx_out_2, w_tx_out_3;
    wire [63:0] w_tx_out_0_0, w_tx_out_0_1, w_tx_out_0_2, w_tx_out_0_3, w_tx_out_0_4, w_tx_out_0_5, w_tx_out_0_6, w_tx_out_0_7;
    wire [63:0] w_tx_out_1_0, w_tx_out_1_1, w_tx_out_1_2, w_tx_out_1_3, w_tx_out_1_4, w_tx_out_1_5, w_tx_out_1_6, w_tx_out_1_7;
    wire [63:0] w_tx_out_2_0, w_tx_out_2_1, w_tx_out_2_2, w_tx_out_2_3, w_tx_out_2_4, w_tx_out_2_5, w_tx_out_2_6, w_tx_out_2_7;
    wire [63:0] w_tx_out_3_0, w_tx_out_3_1, w_tx_out_3_2, w_tx_out_3_3, w_tx_out_3_4, w_tx_out_3_5, w_tx_out_3_6, w_tx_out_3_7;
    
    complexMult cm_0_0(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_0), .theta(2'b00), .n(3'b000));
    complexMult cm_0_1(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_1), .theta(2'b00), .n(3'b001));
    complexMult cm_0_2(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_2), .theta(2'b00), .n(3'b010));
    complexMult cm_0_3(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_3), .theta(2'b00), .n(3'b011));
    complexMult cm_0_4(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_4), .theta(2'b00), .n(3'b100));
    complexMult cm_0_5(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_5), .theta(2'b00), .n(3'b101));
    complexMult cm_0_6(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_6), .theta(2'b00), .n(3'b110));
    complexMult cm_0_7(.clk(clk), .reset(reset), .complexIn(w_tx_din_0), .complexOut(w_tx_out_0_7), .theta(2'b00), .n(3'b111));

    complexMult cm_1_0(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_0), .theta(2'b01), .n(3'b000));
    complexMult cm_1_1(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_1), .theta(2'b01), .n(3'b001));
    complexMult cm_1_2(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_2), .theta(2'b01), .n(3'b010));
    complexMult cm_1_3(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_3), .theta(2'b01), .n(3'b011));
    complexMult cm_1_4(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_4), .theta(2'b01), .n(3'b100));
    complexMult cm_1_5(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_5), .theta(2'b01), .n(3'b101));
    complexMult cm_1_6(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_6), .theta(2'b01), .n(3'b110));
    complexMult cm_1_7(.clk(clk), .reset(reset), .complexIn(w_tx_din_1), .complexOut(w_tx_out_1_7), .theta(2'b01), .n(3'b111));

    complexMult cm_2_0(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_0), .theta(2'b10), .n(3'b000));
    complexMult cm_2_1(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_1), .theta(2'b10), .n(3'b001));
    complexMult cm_2_2(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_2), .theta(2'b10), .n(3'b010));
    complexMult cm_2_3(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_3), .theta(2'b10), .n(3'b011));
    complexMult cm_2_4(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_4), .theta(2'b10), .n(3'b100));
    complexMult cm_2_5(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_5), .theta(2'b10), .n(3'b101));
    complexMult cm_2_6(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_6), .theta(2'b10), .n(3'b110));
    complexMult cm_2_7(.clk(clk), .reset(reset), .complexIn(w_tx_din_2), .complexOut(w_tx_out_2_7), .theta(2'b10), .n(3'b111));

    complexMult cm_3_0(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_0), .theta(2'b11), .n(3'b000));
    complexMult cm_3_1(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_1), .theta(2'b11), .n(3'b001));
    complexMult cm_3_2(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_2), .theta(2'b11), .n(3'b010));
    complexMult cm_3_3(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_3), .theta(2'b11), .n(3'b011));
    complexMult cm_3_4(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_4), .theta(2'b11), .n(3'b100));
    complexMult cm_3_5(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_5), .theta(2'b11), .n(3'b101));
    complexMult cm_3_6(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_6), .theta(2'b11), .n(3'b110));
    complexMult cm_3_7(.clk(clk), .reset(reset), .complexIn(w_tx_din_3), .complexOut(w_tx_out_3_7), .theta(2'b11), .n(3'b111));
    
    assign w_tx_out_0 = {w_tx_out_0_0,w_tx_out_0_1,w_tx_out_0_2,w_tx_out_0_3,w_tx_out_0_4,w_tx_out_0_5,w_tx_out_0_6,w_tx_out_0_7}; // the order is IMPORTANT
    assign w_tx_out_1 = {w_tx_out_1_0,w_tx_out_1_1,w_tx_out_1_2,w_tx_out_1_3,w_tx_out_1_4,w_tx_out_1_5,w_tx_out_1_6,w_tx_out_1_7};
    assign w_tx_out_2 = {w_tx_out_2_0,w_tx_out_2_1,w_tx_out_2_2,w_tx_out_2_3,w_tx_out_2_4,w_tx_out_2_5,w_tx_out_2_6,w_tx_out_2_7};    
    assign w_tx_out_3 = {w_tx_out_3_0,w_tx_out_3_1,w_tx_out_3_2,w_tx_out_3_3,w_tx_out_3_4,w_tx_out_3_5,w_tx_out_3_6,w_tx_out_3_7};
    
endmodule
