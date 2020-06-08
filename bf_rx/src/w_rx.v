`timescale 1ns / 1ps


// Outputs one value, {data_out_im, data_out_r} and a valid signal
// matrix multiplication of 1x16 matrix(dataRX) and 16x1 matrix(weight_rx) 
module computeMult8(input clk, input reset, input [1695:0] dataRX, output [15:0] data_out_im, output [15:0] data_out_r, input [4:0] counter, output reg valid);
//output [33:0] data_out_im, output [33:0] data_out_r
    wire signed [15:0] w_im_0, w_im_1, w_im_2, w_im_3, w_im_4, w_im_5, w_im_6, w_im_7, w_im_8, w_im_9, w_im_10, w_im_11, w_im_12, w_im_13, w_im_14, w_im_15;
    wire signed [15:0] w_r_0, w_r_1, w_r_2, w_r_3, w_r_4, w_r_5, w_r_6, w_r_7, w_r_8, w_r_9, w_r_10, w_r_11, w_r_12, w_r_13, w_r_14, w_r_15;
    
    assign {w_im_0, w_im_1, w_im_2, w_im_3, w_im_4, w_im_5, w_im_6, w_im_7, w_im_8, w_im_9, w_im_10, w_im_11, w_im_12, w_im_13, w_im_14, w_im_15} =
        {16'h6943, 16'h51a5, 16'h33f3, 16'h1262, 16'hef72, 16'hcdbe, 16'hafc8, 16'h97cc, 16'h8794, 16'h8055, 16'h8299, 16'h8e34, 16'ha24a, 16'hbd5b, 16'hdd64, 16'h0000};
    assign {w_r_0, w_r_1, w_r_2, w_r_3, w_r_4, w_r_5, w_r_6, w_r_7, w_r_8, w_r_9, w_r_10, w_r_11, w_r_12, w_r_13, w_r_14, w_r_15} =
        {16'hb72b, 16'h9d6c, 16'h8b04, 16'h8154, 16'h8113, 16'h8a48, 16'h9c41, 16'hb5aa, 16'hd49b, 16'hf6c9, 16'h19a6, 16'h3a9b, 16'h5731, 16'h6d48, 16'h7b3b, 16'h7fff};

    wire signed [52:0] data_im_0, data_r_0, data_im_1, data_r_1, data_im_2, data_r_2, data_im_3, data_r_3, 
        data_im_4, data_r_4, data_im_5, data_r_5, data_im_6, data_r_6, data_im_7, data_r_7, 
        data_im_8, data_r_8, data_im_9, data_r_9, data_im_10, data_r_10, data_im_11, data_r_11, 
        data_im_12, data_r_12, data_im_13, data_r_13, data_im_14, data_r_14, data_im_15, data_r_15; 

    assign {data_im_0, data_r_0, data_im_1, data_r_1, data_im_2, data_r_2, data_im_3, data_r_3, 
        data_im_4, data_r_4, data_im_5, data_r_5, data_im_6, data_r_6, data_im_7, data_r_7, 
        data_im_8, data_r_8, data_im_9, data_r_9, data_im_10, data_r_10, data_im_11, data_r_11, 
        data_im_12, data_r_12, data_im_13, data_r_13, data_im_14, data_r_14, data_im_15, data_r_15} = dataRX;

    reg signed [68:0] data_out_im_0, data_out_im_1, data_out_im_2, data_out_im_3, data_out_im_4, data_out_im_5, data_out_im_6, data_out_im_7,
        data_out_im_8, data_out_im_9, data_out_im_10, data_out_im_11, data_out_im_12, data_out_im_13, data_out_im_14, data_out_im_15;
    reg signed [68:0] data_out_r_0, data_out_r_1, data_out_r_2, data_out_r_3, data_out_r_4, data_out_r_5, data_out_r_6, data_out_r_7,
        data_out_r_8, data_out_r_9, data_out_r_10, data_out_r_11, data_out_r_12, data_out_r_13, data_out_r_14, data_out_r_15;

    wire signed [72:0] data_out_im_full, data_out_r_full;
    assign data_out_im_full = data_out_im_0 + data_out_im_1 + data_out_im_2 + data_out_im_3 + data_out_im_4 + data_out_im_5 + data_out_im_6 + data_out_im_7 + 
        data_out_im_8 + data_out_im_9 + data_out_im_10 + data_out_im_11 + data_out_im_12 + data_out_im_13 + data_out_im_14 + data_out_im_15;
    assign data_out_r_full = data_out_r_0 + data_out_r_1 + data_out_r_2 + data_out_r_3 + data_out_r_4 + data_out_r_5 + data_out_r_6 + data_out_r_7 + 
        data_out_r_8 + data_out_r_9 + data_out_r_10 + data_out_r_11 + data_out_r_12 + data_out_r_13 + data_out_r_14 + data_out_r_15;
//    assign data_out_im = data_out_im_full[72:39];
//    assign data_out_r = data_out_r_full[72:39];
    assign data_out_im = data_out_im_full[72:57];
    assign data_out_r = data_out_r_full[72:57];

            
    always@(posedge clk) begin
        if(reset) begin
            data_out_im_0 <= 69'b0;
            data_out_r_0 <= 69'b0;
            data_out_im_1 <= 69'b0;
            data_out_r_1 <= 69'b0;
            data_out_im_2 <= 69'b0;
            data_out_r_2 <= 69'b0;
            data_out_im_3 <= 69'b0;
            data_out_r_3 <= 69'b0;
            
            data_out_im_4 <= 69'b0;
            data_out_r_4 <= 69'b0;
            data_out_im_5 <= 69'b0;
            data_out_r_5 <= 69'b0;
            data_out_im_6 <= 69'b0;
            data_out_r_6 <= 69'b0;
            data_out_im_7 <= 69'b0;
            data_out_r_7 <= 69'b0;

            data_out_im_8 <= 69'b0;
            data_out_r_8 <= 69'b0;
            data_out_im_9 <= 69'b0;
            data_out_r_9 <= 69'b0;
            data_out_im_10 <= 69'b0;
            data_out_r_10 <= 69'b0;
            data_out_im_11 <= 69'b0;
            data_out_r_11 <= 69'b0;

            data_out_im_12 <= 69'b0;
            data_out_r_12 <= 69'b0;
            data_out_im_13 <= 69'b0;
            data_out_r_13 <= 69'b0;
            data_out_im_14 <= 69'b0;
            data_out_r_14 <= 69'b0;
            data_out_im_15 <= 69'b0;
            data_out_r_15 <= 69'b0;

            valid <= 1'b0;
        end
        else begin
            if(counter == 5'b10000) begin
                data_out_im_0 <= w_im_0*data_r_0 + w_r_0*data_im_0; // fixed16_15*fixed53_45 + fixed16_15*fixed53_45 = fixed69_60
                data_out_r_0 <= -w_im_0*data_im_0 + w_r_0*data_r_0;
                data_out_im_1 <= w_im_1*data_r_1 + w_r_1*data_im_1;
                data_out_r_1 <= -w_im_1*data_im_1 + w_r_1*data_r_1;
                data_out_im_2 <= w_im_2*data_r_2 + w_r_2*data_im_2;
                data_out_r_2 <= -w_im_2*data_im_2 + w_r_2*data_r_2;
                data_out_im_3 <= w_im_3*data_r_3 + w_r_3*data_im_3;
                data_out_r_3 <= -w_im_3*data_im_3 + w_r_3*data_r_3;
                
                data_out_im_4 <= w_im_4*data_r_4 + w_r_4*data_im_4;
                data_out_r_4 <= -w_im_4*data_im_4 + w_r_4*data_r_4;
                data_out_im_5 <= w_im_5*data_r_5 + w_r_5*data_im_5;
                data_out_r_5 <= -w_im_5*data_im_5 + w_r_5*data_r_5;
                data_out_im_6 <= w_im_6*data_r_6 + w_r_6*data_im_6;
                data_out_r_6 <= -w_im_6*data_im_6 + w_r_6*data_r_6;
                data_out_im_7 <= w_im_7*data_r_7 + w_r_7*data_im_7;
                data_out_r_7 <= -w_im_7*data_im_7 + w_r_7*data_r_7;

                data_out_im_8 <= w_im_8*data_r_8 + w_r_8*data_im_8;
                data_out_r_8 <= -w_im_8*data_im_8 + w_r_8*data_r_8;
                data_out_im_9 <= w_im_9*data_r_9 + w_r_9*data_im_9;
                data_out_r_9 <= -w_im_9*data_im_9 + w_r_9*data_r_9;
                data_out_im_10 <= w_im_10*data_r_10 + w_r_10*data_im_10;
                data_out_r_10 <= -w_im_10*data_im_10 + w_r_10*data_r_10;
                data_out_im_11 <= w_im_11*data_r_11 + w_r_11*data_im_11;
                data_out_r_11 <= -w_im_11*data_im_11 + w_r_11*data_r_11;

                data_out_im_12 <= w_im_12*data_r_12 + w_r_12*data_im_12;
                data_out_r_12 <= -w_im_12*data_im_12 + w_r_12*data_r_12;
                data_out_im_13 <= w_im_13*data_r_13 + w_r_13*data_im_13;
                data_out_r_13 <= -w_im_13*data_im_13 + w_r_13*data_r_13;
                data_out_im_14 <= w_im_14*data_r_14 + w_r_14*data_im_14;
                data_out_r_14 <= -w_im_14*data_im_14 + w_r_14*data_r_14;
                data_out_im_15 <= w_im_15*data_r_15 + w_r_15*data_im_15;
                data_out_r_15 <= -w_im_15*data_im_15 + w_r_15*data_r_15;

                valid <= 1'b1;                
            end
            else begin
                data_out_im_0 <= 69'b0;
                data_out_r_0 <= 69'b0;
                data_out_im_1 <= 69'b0;
                data_out_r_1 <= 69'b0;
                data_out_im_2 <= 69'b0;
                data_out_r_2 <= 69'b0;
                data_out_im_3 <= 69'b0;
                data_out_r_3 <= 69'b0;
                
                data_out_im_4 <= 69'b0;
                data_out_r_4 <= 69'b0;
                data_out_im_5 <= 69'b0;
                data_out_r_5 <= 69'b0;
                data_out_im_6 <= 69'b0;
                data_out_r_6 <= 69'b0;
                data_out_im_7 <= 69'b0;
                data_out_r_7 <= 69'b0;
    
                data_out_im_8 <= 69'b0;
                data_out_r_8 <= 69'b0;
                data_out_im_9 <= 69'b0;
                data_out_r_9 <= 69'b0;
                data_out_im_10 <= 69'b0;
                data_out_r_10 <= 69'b0;
                data_out_im_11 <= 69'b0;
                data_out_r_11 <= 69'b0;
    
                data_out_im_12 <= 69'b0;
                data_out_r_12 <= 69'b0;
                data_out_im_13 <= 69'b0;
                data_out_r_13 <= 69'b0;
                data_out_im_14 <= 69'b0;
                data_out_r_14 <= 69'b0;
                data_out_im_15 <= 69'b0;
                data_out_r_15 <= 69'b0;

                valid <= 1'b0;
            end
        end
    end

endmodule


// Outputs a pre_fft_data after weight_rx multiplication
// Receives 53bits of data in serial for 32 cycles.
module w_rx(input clk, input resetn,
    input FMC_valid_cable,
    input FMC_isIM_cable,
    output reg FMC_ready_cable,
    input [52:0] FMC_data_cable,
//    output [67:0] fifo_in,
    output [31:0] fifo_in,
    output fifo_wr_en,
    input fifo_ready);
    
    wire [1695:0] dataRX;
    wire [33:0] data;
    
    reg [4:0] counter;
    reg [52:0] data_imag_0, data_real_0, data_imag_1, data_real_1, data_imag_2, data_real_2, data_imag_3, data_real_3, 
        data_imag_4, data_real_4, data_imag_5, data_real_5, data_imag_6, data_real_6, data_imag_7, data_real_7, 
        data_imag_8, data_real_8, data_imag_9, data_real_9, data_imag_10, data_real_10, data_imag_11, data_real_11, 
        data_imag_12, data_real_12, data_imag_13, data_real_13, data_imag_14, data_real_14, data_imag_15, data_real_15; 
    
    always@(posedge clk) begin
        if(!resetn) begin
            FMC_ready_cable <= 1'b0;
            counter <= 5'b0;
            data_imag_0 <= 53'b0;
            data_real_0 <= 53'b0;
            data_imag_1 <= 53'b0;
            data_real_1 <= 53'b0;
            data_imag_2 <= 53'b0;
            data_real_2 <= 53'b0;
            data_imag_3 <= 53'b0;
            data_real_3 <= 53'b0;
            data_imag_4 <= 53'b0;
            data_real_4 <= 53'b0;
            data_imag_5 <= 53'b0;
            data_real_5 <= 53'b0;
            data_imag_6 <= 53'b0;
            data_real_6 <= 53'b0;
            data_imag_7 <= 53'b0;
            data_real_7 <= 53'b0;            
            data_imag_8 <= 53'b0;
            data_real_8 <= 53'b0;
            data_imag_9 <= 53'b0;
            data_real_9 <= 53'b0;
            data_imag_10 <= 53'b0;
            data_real_10 <= 53'b0;
            data_imag_11 <= 53'b0;
            data_real_11 <= 53'b0;
            data_imag_12 <= 53'b0;
            data_real_12 <= 53'b0;
            data_imag_13 <= 53'b0;
            data_real_13 <= 53'b0;
            data_imag_14 <= 53'b0;
            data_real_14 <= 53'b0;
            data_imag_15 <= 53'b0;
            data_real_15 <= 53'b0;
        end
        else begin
            if(counter==5'b00000 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_0 <= FMC_data_cable;
                counter <=  counter;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00000 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_0 <= FMC_data_cable;
                counter <=  counter + 5'b00001;
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00001 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_1 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00001 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_1 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00010 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_2 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00010 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_2 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00011 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_3 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00011 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_3 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00100 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_4 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00100 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_4 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00101 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_5 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00101 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_5 <= FMC_data_cable;
                counter <=  counter + 5'b00001;
                FMC_ready_cable <= 1'b0;                
            end

            else if(counter==5'b00110 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_6 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00110 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_6 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b00111 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_7 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b00111 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_7 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01000 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_8 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01000 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_8 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01001 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_9 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01001 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_9 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01010 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_10 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01010 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_10 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01011 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_11 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01011 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_11 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01100 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_12 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01100 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_12 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01101 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_13 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01101 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_13 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01110 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_14 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01110 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_14 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end

            else if(counter==5'b01111 && FMC_valid_cable && FMC_isIM_cable) begin
                data_imag_15 <= FMC_data_cable;
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b01111 && FMC_valid_cable && !FMC_isIM_cable) begin
                data_real_15 <= FMC_data_cable;
                counter <=  counter + 5'b00001;                
                FMC_ready_cable <= 1'b0;
            end
            else if(counter==5'b10000) begin
                counter <=  5'b00000;
                FMC_ready_cable <= fifo_ready;
            end
            else begin // idle
                counter <=  5'b00000; // counter stays at 0
                FMC_ready_cable <= fifo_ready;
            end

        end
    end
    
    assign dataRX = {data_imag_0, data_real_0, data_imag_1, data_real_1, data_imag_2, data_real_2, data_imag_3, data_real_3, 
        data_imag_4, data_real_4, data_imag_5, data_real_5, data_imag_6, data_real_6, data_imag_7, data_real_7, 
        data_imag_8, data_real_8, data_imag_9, data_real_9, data_imag_10, data_real_10, data_imag_11, data_real_11, 
        data_imag_12, data_real_12, data_imag_13, data_real_13, data_imag_14, data_real_14, data_imag_15, data_real_15};

//    wire [33:0] data_out_im, data_out_r;
    wire [15:0] data_out_im, data_out_r;

    wire valid;
    
    
    computeMult8 cm(.clk(clk), .reset(reset), .dataRX(dataRX), .data_out_im(data_out_im), .data_out_r(data_out_r), .counter(counter), .valid(valid));
    assign fifo_in = {data_out_im,data_out_r};
    assign fifo_wr_en = valid;
    
endmodule
