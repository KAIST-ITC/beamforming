`timescale 1ns / 1ps

module mat_H_lookup(output reg [255:0] mat_H_row, input [1:0] h_index, input [3:0] row_index);
    always @(*) begin
        case({h_index,row_index})
            6'b000000: mat_H_row <= 256'h96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888_bef06e3b_df2b7bb8;
            6'b000001: mat_H_row <= 256'hae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888_bef06e3b;
            6'b000010: mat_H_row <= 256'hcc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888;
            6'b000011: mat_H_row <= 256'hed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c;
            6'b000100: mat_H_row <= 256'h108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74;
            6'b000101: mat_H_row <= 256'h32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0;
            6'b000110: mat_H_row <= 256'h50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658;
            6'b000111: mat_H_row <= 256'h6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b;
            6'b001000: mat_H_row <= 256'h786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c;
            6'b001001: mat_H_row <= 256'h7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04;
            6'b001010: mat_H_row <= 256'h7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154;
            6'b001011: mat_H_row <= 256'h71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113;
            6'b001100: mat_H_row <= 256'h5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48;
            6'b001101: mat_H_row <= 256'h42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41;
            6'b001110: mat_H_row <= 256'h229c7b3b_42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa;
            6'b001111: mat_H_row <= 256'h00007fff_229c7b3b_42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b;

            6'b010000: mat_H_row <= 256'h70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315_30fd89bf_9904b3fc;
            6'b010001: mat_H_row <= 256'hdede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315_30fd89bf;
            6'b010010: mat_H_row <= 256'h8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315;
            6'b010011: mat_H_row <= 256'he3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71;
            6'b010100: mat_H_row <= 256'h7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45;
            6'b010101: mat_H_row <= 256'h537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9;
            6'b010110: mat_H_row <= 256'hb5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c;
            6'b010111: mat_H_row <= 256'h88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec;
            6'b011000: mat_H_row <= 256'h10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3;
            6'b011001: mat_H_row <= 256'h7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a;
            6'b011010: mat_H_row <= 256'h2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335;
            6'b011011: mat_H_row <= 256'h963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652;
            6'b011100: mat_H_row <= 256'ha08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106;
            6'b011101: mat_H_row <= 256'h3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864;
            6'b011110: mat_H_row <= 256'h7c3c1ed0_3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c;
            6'b011111: mat_H_row <= 256'h00007fff_7c3c1ed0_3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118;

            6'b100000: mat_H_row <= 256'h78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373_3a628e17_8200168b;
            6'b100001: mat_H_row <= 256'hd84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373_3a628e17;
            6'b100010: mat_H_row <= 256'hb74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373;
            6'b100011: mat_H_row <= 256'h7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e;
            6'b100100: mat_H_row <= 256'hadd86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb;
            6'b100101: mat_H_row <= 256'he3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba;
            6'b100110: mat_H_row <= 256'h747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b;
            6'b100111: mat_H_row <= 256'h8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee;
            6'b101000: mat_H_row <= 256'h14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac;
            6'b101001: mat_H_row <= 256'h58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad;
            6'b101010: mat_H_row <= 256'h80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb;
            6'b101011: mat_H_row <= 256'h41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228;
            6'b101100: mat_H_row <= 256'h2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d;
            6'b101101: mat_H_row <= 256'h849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e;
            6'b101110: mat_H_row <= 256'h65d9b278_849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e;
            6'b101111: mat_H_row <= 256'h00007fff_65d9b278_849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198;

            6'b110000: mat_H_row <= 256'h859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614_f2f880aa_e7887da4;
            6'b110001: mat_H_row <= 256'h6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614_f2f880aa;
            6'b110010: mat_H_row <= 256'haf086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614;
            6'b110011: mat_H_row <= 256'h30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56;
            6'b110100: mat_H_row <= 256'hf3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4;
            6'b110101: mat_H_row <= 256'he6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39;
            6'b110110: mat_H_row <= 256'h3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1;
            6'b110111: mat_H_row <= 256'ha55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d;
            6'b111000: mat_H_row <= 256'h70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e;
            6'b111001: mat_H_row <= 256'h826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323;
            6'b111010: mat_H_row <= 256'h7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3;
            6'b111011: mat_H_row <= 256'h89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69;
            6'b111100: mat_H_row <= 256'h62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281;
            6'b111101: mat_H_row <= 256'hb8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca;
            6'b111110: mat_H_row <= 256'h25228581_b8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f;
            6'b111111: mat_H_row <= 256'h00007fff_25228581_b8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32;
            default: mat_H_row <= 256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000;
        endcase
    end
endmodule

module computeH(input clk, input resetn, input [255:0] mat_H_row, input [511:0] w_tx_out, output [101:0] post_H); // each imag or real is fixed51_45
    wire signed [15:0] H_0_imag, H_0_real, H_1_imag, H_1_real, H_2_imag, H_2_real, H_3_imag, H_3_real; 
    wire signed [15:0] H_4_imag, H_4_real, H_5_imag, H_5_real, H_6_imag, H_6_real, H_7_imag, H_7_real;
    wire signed [31:0] w_tx_0_imag, w_tx_0_real, w_tx_1_imag, w_tx_1_real, w_tx_2_imag, w_tx_2_real, w_tx_3_imag, w_tx_3_real;
    wire signed [31:0] w_tx_4_imag, w_tx_4_real, w_tx_5_imag, w_tx_5_real, w_tx_6_imag, w_tx_6_real, w_tx_7_imag, w_tx_7_real;
    reg signed [50:0] imag_part, real_part; // no overflow making sure, fixed51_45
    
    assign {H_0_imag, H_0_real, H_1_imag, H_1_real, H_2_imag, H_2_real, H_3_imag, H_3_real, H_4_imag, H_4_real, H_5_imag, H_5_real, H_6_imag, H_6_real, H_7_imag, H_7_real} = mat_H_row;
    assign {w_tx_0_imag, w_tx_0_real, w_tx_1_imag, w_tx_1_real, w_tx_2_imag, w_tx_2_real, w_tx_3_imag, w_tx_3_real, w_tx_4_imag, w_tx_4_real, w_tx_5_imag, w_tx_5_real, w_tx_6_imag, w_tx_6_real, w_tx_7_imag, w_tx_7_real} = w_tx_out;
    
    always@(posedge clk) begin
        if(!resetn) begin
            imag_part <= 0;
            real_part <= 0;
        end
        else begin
            imag_part <= (H_0_real*w_tx_0_imag + H_0_imag*w_tx_0_real) + (H_1_real*w_tx_1_imag + H_1_imag*w_tx_1_real) + (H_2_real*w_tx_2_imag + H_2_imag*w_tx_2_real) + (H_3_real*w_tx_3_imag + H_3_imag*w_tx_3_real) + 
                (H_4_real*w_tx_4_imag + H_4_imag*w_tx_4_real) + (H_5_real*w_tx_5_imag + H_5_imag*w_tx_5_real) + (H_6_real*w_tx_6_imag + H_6_imag*w_tx_6_real) + (H_7_real*w_tx_7_imag + H_7_imag*w_tx_7_real);
            real_part <= (H_0_real*w_tx_0_real - H_0_imag*w_tx_0_imag) + (H_1_real*w_tx_1_real - H_1_imag*w_tx_1_imag) + (H_2_real*w_tx_2_real - H_2_imag*w_tx_2_imag) + (H_3_real*w_tx_3_real - H_3_imag*w_tx_3_imag) + 
                (H_4_real*w_tx_4_real - H_4_imag*w_tx_4_imag) + (H_5_real*w_tx_5_real - H_5_imag*w_tx_5_imag) + (H_6_real*w_tx_6_real - H_6_imag*w_tx_6_imag) + (H_7_real*w_tx_7_real - H_7_imag*w_tx_7_imag);    
        end
    end
    assign post_H = {imag_part,real_part};
endmodule

module applyH(input clk, input resetn,
    input [511:0] w_tx_out_0, // each imag or real is fixed32_30
    input [511:0] w_tx_out_1, 
    input [511:0] w_tx_out_2, 
    input [511:0] w_tx_out_3,
    input FMC_valid,
    input FMC_isIM,
    output reg FMC_ready,
    output reg FMC_valid_cable,
    output reg FMC_isIM_cable,
    input FMC_ready_cable,
    output reg [52:0] FMC_data_cable); // each data is 
    
    wire [255:0] mat_H_row_0_0, mat_H_row_0_1, mat_H_row_0_2, mat_H_row_0_3, mat_H_row_0_4, mat_H_row_0_5, mat_H_row_0_6, mat_H_row_0_7,
        mat_H_row_0_8, mat_H_row_0_9, mat_H_row_0_10, mat_H_row_0_11, mat_H_row_0_12, mat_H_row_0_13, mat_H_row_0_14, mat_H_row_0_15;
    wire [255:0] mat_H_row_1_0, mat_H_row_1_1, mat_H_row_1_2, mat_H_row_1_3, mat_H_row_1_4, mat_H_row_1_5, mat_H_row_1_6, mat_H_row_1_7, 
        mat_H_row_1_8, mat_H_row_1_9, mat_H_row_1_10, mat_H_row_1_11, mat_H_row_1_12, mat_H_row_1_13, mat_H_row_1_14, mat_H_row_1_15;
    wire [255:0] mat_H_row_2_0, mat_H_row_2_1, mat_H_row_2_2, mat_H_row_2_3, mat_H_row_2_4, mat_H_row_2_5, mat_H_row_2_6, mat_H_row_2_7, 
        mat_H_row_2_8, mat_H_row_2_9, mat_H_row_2_10, mat_H_row_2_11, mat_H_row_2_12, mat_H_row_2_13, mat_H_row_2_14, mat_H_row_2_15;
    wire [255:0] mat_H_row_3_0, mat_H_row_3_1, mat_H_row_3_2, mat_H_row_3_3, mat_H_row_3_4, mat_H_row_3_5, mat_H_row_3_6, mat_H_row_3_7, 
        mat_H_row_3_8, mat_H_row_3_9, mat_H_row_3_10, mat_H_row_3_11, mat_H_row_3_12, mat_H_row_3_13, mat_H_row_3_14, mat_H_row_3_15;


    mat_H_lookup mHl_0_0(.mat_H_row(mat_H_row_0_0), .h_index(2'b00), .row_index(4'b0000));
    mat_H_lookup mHl_0_1(.mat_H_row(mat_H_row_0_1), .h_index(2'b00), .row_index(4'b0001));
    mat_H_lookup mHl_0_2(.mat_H_row(mat_H_row_0_2), .h_index(2'b00), .row_index(4'b0010));
    mat_H_lookup mHl_0_3(.mat_H_row(mat_H_row_0_3), .h_index(2'b00), .row_index(4'b0011));
    mat_H_lookup mHl_0_4(.mat_H_row(mat_H_row_0_4), .h_index(2'b00), .row_index(4'b0100));
    mat_H_lookup mHl_0_5(.mat_H_row(mat_H_row_0_5), .h_index(2'b00), .row_index(4'b0101));
    mat_H_lookup mHl_0_6(.mat_H_row(mat_H_row_0_6), .h_index(2'b00), .row_index(4'b0110));
    mat_H_lookup mHl_0_7(.mat_H_row(mat_H_row_0_7), .h_index(2'b00), .row_index(4'b0111));
    mat_H_lookup mHl_0_8(.mat_H_row(mat_H_row_0_8), .h_index(2'b00), .row_index(4'b1000));
    mat_H_lookup mHl_0_9(.mat_H_row(mat_H_row_0_9), .h_index(2'b00), .row_index(4'b1001));
    mat_H_lookup mHl_0_10(.mat_H_row(mat_H_row_0_10), .h_index(2'b00), .row_index(4'b1010));
    mat_H_lookup mHl_0_11(.mat_H_row(mat_H_row_0_11), .h_index(2'b00), .row_index(4'b1011));
    mat_H_lookup mHl_0_12(.mat_H_row(mat_H_row_0_12), .h_index(2'b00), .row_index(4'b1100));
    mat_H_lookup mHl_0_13(.mat_H_row(mat_H_row_0_13), .h_index(2'b00), .row_index(4'b1101));
    mat_H_lookup mHl_0_14(.mat_H_row(mat_H_row_0_14), .h_index(2'b00), .row_index(4'b1110));
    mat_H_lookup mHl_0_15(.mat_H_row(mat_H_row_0_15), .h_index(2'b00), .row_index(4'b1111));

    mat_H_lookup mHl_1_0(.mat_H_row(mat_H_row_1_0), .h_index(2'b01), .row_index(4'b0000));
    mat_H_lookup mHl_1_1(.mat_H_row(mat_H_row_1_1), .h_index(2'b01), .row_index(4'b0001));
    mat_H_lookup mHl_1_2(.mat_H_row(mat_H_row_1_2), .h_index(2'b01), .row_index(4'b0010));
    mat_H_lookup mHl_1_3(.mat_H_row(mat_H_row_1_3), .h_index(2'b01), .row_index(4'b0011));
    mat_H_lookup mHl_1_4(.mat_H_row(mat_H_row_1_4), .h_index(2'b01), .row_index(4'b0100));
    mat_H_lookup mHl_1_5(.mat_H_row(mat_H_row_1_5), .h_index(2'b01), .row_index(4'b0101));
    mat_H_lookup mHl_1_6(.mat_H_row(mat_H_row_1_6), .h_index(2'b01), .row_index(4'b0110));
    mat_H_lookup mHl_1_7(.mat_H_row(mat_H_row_1_7), .h_index(2'b01), .row_index(4'b0111));
    mat_H_lookup mHl_1_8(.mat_H_row(mat_H_row_1_8), .h_index(2'b01), .row_index(4'b1000));
    mat_H_lookup mHl_1_9(.mat_H_row(mat_H_row_1_9), .h_index(2'b01), .row_index(4'b1001));
    mat_H_lookup mHl_1_10(.mat_H_row(mat_H_row_1_10), .h_index(2'b01), .row_index(4'b1010));
    mat_H_lookup mHl_1_11(.mat_H_row(mat_H_row_1_11), .h_index(2'b01), .row_index(4'b1011));
    mat_H_lookup mHl_1_12(.mat_H_row(mat_H_row_1_12), .h_index(2'b01), .row_index(4'b1100));
    mat_H_lookup mHl_1_13(.mat_H_row(mat_H_row_1_13), .h_index(2'b01), .row_index(4'b1101));
    mat_H_lookup mHl_1_14(.mat_H_row(mat_H_row_1_14), .h_index(2'b01), .row_index(4'b1110));
    mat_H_lookup mHl_1_15(.mat_H_row(mat_H_row_1_15), .h_index(2'b01), .row_index(4'b1111));

    mat_H_lookup mHl_2_0(.mat_H_row(mat_H_row_2_0), .h_index(2'b10), .row_index(4'b0000));
    mat_H_lookup mHl_2_1(.mat_H_row(mat_H_row_2_1), .h_index(2'b10), .row_index(4'b0001));
    mat_H_lookup mHl_2_2(.mat_H_row(mat_H_row_2_2), .h_index(2'b10), .row_index(4'b0010));
    mat_H_lookup mHl_2_3(.mat_H_row(mat_H_row_2_3), .h_index(2'b10), .row_index(4'b0011));
    mat_H_lookup mHl_2_4(.mat_H_row(mat_H_row_2_4), .h_index(2'b10), .row_index(4'b0100));
    mat_H_lookup mHl_2_5(.mat_H_row(mat_H_row_2_5), .h_index(2'b10), .row_index(4'b0101));
    mat_H_lookup mHl_2_6(.mat_H_row(mat_H_row_2_6), .h_index(2'b10), .row_index(4'b0110));
    mat_H_lookup mHl_2_7(.mat_H_row(mat_H_row_2_7), .h_index(2'b10), .row_index(4'b0111));
    mat_H_lookup mHl_2_8(.mat_H_row(mat_H_row_2_8), .h_index(2'b10), .row_index(4'b1000));
    mat_H_lookup mHl_2_9(.mat_H_row(mat_H_row_2_9), .h_index(2'b10), .row_index(4'b1001));
    mat_H_lookup mHl_2_10(.mat_H_row(mat_H_row_2_10), .h_index(2'b10), .row_index(4'b1010));
    mat_H_lookup mHl_2_11(.mat_H_row(mat_H_row_2_11), .h_index(2'b10), .row_index(4'b1011));
    mat_H_lookup mHl_2_12(.mat_H_row(mat_H_row_2_12), .h_index(2'b10), .row_index(4'b1100));
    mat_H_lookup mHl_2_13(.mat_H_row(mat_H_row_2_13), .h_index(2'b10), .row_index(4'b1101));
    mat_H_lookup mHl_2_14(.mat_H_row(mat_H_row_2_14), .h_index(2'b10), .row_index(4'b1110));
    mat_H_lookup mHl_2_15(.mat_H_row(mat_H_row_2_15), .h_index(2'b10), .row_index(4'b1111));

    mat_H_lookup mHl_3_0(.mat_H_row(mat_H_row_3_0), .h_index(2'b11), .row_index(4'b0000));
    mat_H_lookup mHl_3_1(.mat_H_row(mat_H_row_3_1), .h_index(2'b11), .row_index(4'b0001));
    mat_H_lookup mHl_3_2(.mat_H_row(mat_H_row_3_2), .h_index(2'b11), .row_index(4'b0010));
    mat_H_lookup mHl_3_3(.mat_H_row(mat_H_row_3_3), .h_index(2'b11), .row_index(4'b0011));
    mat_H_lookup mHl_3_4(.mat_H_row(mat_H_row_3_4), .h_index(2'b11), .row_index(4'b0100));
    mat_H_lookup mHl_3_5(.mat_H_row(mat_H_row_3_5), .h_index(2'b11), .row_index(4'b0101));
    mat_H_lookup mHl_3_6(.mat_H_row(mat_H_row_3_6), .h_index(2'b11), .row_index(4'b0110));
    mat_H_lookup mHl_3_7(.mat_H_row(mat_H_row_3_7), .h_index(2'b11), .row_index(4'b0111));
    mat_H_lookup mHl_3_8(.mat_H_row(mat_H_row_3_8), .h_index(2'b11), .row_index(4'b1000));
    mat_H_lookup mHl_3_9(.mat_H_row(mat_H_row_3_9), .h_index(2'b11), .row_index(4'b1001));
    mat_H_lookup mHl_3_10(.mat_H_row(mat_H_row_3_10), .h_index(2'b11), .row_index(4'b1010));
    mat_H_lookup mHl_3_11(.mat_H_row(mat_H_row_3_11), .h_index(2'b11), .row_index(4'b1011));
    mat_H_lookup mHl_3_12(.mat_H_row(mat_H_row_3_12), .h_index(2'b11), .row_index(4'b1100));
    mat_H_lookup mHl_3_13(.mat_H_row(mat_H_row_3_13), .h_index(2'b11), .row_index(4'b1101));
    mat_H_lookup mHl_3_14(.mat_H_row(mat_H_row_3_14), .h_index(2'b11), .row_index(4'b1110));
    mat_H_lookup mHl_3_15(.mat_H_row(mat_H_row_3_15), .h_index(2'b11), .row_index(4'b1111));

    reg [255:0] mat_H_row_0, mat_H_row_1, mat_H_row_2, mat_H_row_3;
    wire [101:0] post_H_0, post_H_1, post_H_2, post_H_3;
    
    wire signed [50:0] post_H_0_imag, post_H_1_imag, post_H_2_imag, post_H_3_imag;
    wire signed [50:0] post_H_0_real, post_H_1_real, post_H_2_real, post_H_3_real;    

    computeH ch_0(.clk(clk), .resetn(resetn), .mat_H_row(mat_H_row_0), .w_tx_out(w_tx_out_0), .post_H(post_H_0));
    computeH ch_1(.clk(clk), .resetn(resetn), .mat_H_row(mat_H_row_1), .w_tx_out(w_tx_out_1), .post_H(post_H_1));
    computeH ch_2(.clk(clk), .resetn(resetn), .mat_H_row(mat_H_row_2), .w_tx_out(w_tx_out_2), .post_H(post_H_2));
    computeH ch_3(.clk(clk), .resetn(resetn), .mat_H_row(mat_H_row_3), .w_tx_out(w_tx_out_3), .post_H(post_H_3));

    assign {post_H_0_imag, post_H_0_real} = post_H_0;
    assign {post_H_1_imag, post_H_1_real} = post_H_1;
    assign {post_H_2_imag, post_H_2_real} = post_H_2;
    assign {post_H_3_imag, post_H_3_real} = post_H_3;

    wire signed [52:0] post_H_sum_imag, post_H_sum_real;
    
    assign post_H_sum_imag = post_H_0_imag + post_H_1_imag + post_H_2_imag + post_H_3_imag;
    assign post_H_sum_real = post_H_0_real + post_H_1_real + post_H_2_real + post_H_3_real;
    
    reg [1:0] processing;
    reg [4:0] counter;
    
    always@(posedge clk) begin
        if(!resetn) begin
            processing <= 2'b00;
            FMC_ready <= 1'b0;
            counter <= 5'b00000;
            mat_H_row_0 <= 0;
            mat_H_row_1 <= 0;
            mat_H_row_2 <= 0;
            mat_H_row_3 <= 0;
            FMC_valid_cable <= 1'b0;
            FMC_data_cable <= 53'b0;            
            FMC_isIM_cable <= 1'b0;
        end
        else begin
//            if(FMC_ready_cable && (processing==2'b00)) begin // ready to accept data
//                FMC_ready <= 1'b1;
//            end
//            else begin // if it's processing data or rx is not ready,
//                FMC_ready <= 1'b0;
//            end 
 
            if(FMC_valid && FMC_ready_cable && (processing==2'b00)) begin
                mat_H_row_0 <= mat_H_row_0_0;
                mat_H_row_1 <= mat_H_row_1_0;
                mat_H_row_2 <= mat_H_row_2_0;
                mat_H_row_3 <= mat_H_row_3_0;
                FMC_valid_cable <= 1'b0;
                FMC_data_cable <= 53'b0;
                FMC_isIM_cable <= 1'b0;
                processing <= 2'b01;
                FMC_ready <= 1'b0;
            end
            else if(processing == 2'b01) begin // fetch from mat_H_lookup
                FMC_valid_cable <= 1'b0;
                processing <= 2'b10;
                FMC_ready <= 1'b0;
            end
            else if(processing == 2'b10) begin // compute H, and post_H_sum's should be ready by this time
                FMC_valid_cable <= 1'b1;
                if(counter==5'b00000) begin // post_H_sum_0
                    mat_H_row_0 <= mat_H_row_0_1;
                    mat_H_row_1 <= mat_H_row_1_1;
                    mat_H_row_2 <= mat_H_row_2_1;
                    mat_H_row_3 <= mat_H_row_3_1;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00001) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00010) begin // post_H_sum_1
                    mat_H_row_0 <= mat_H_row_0_2;
                    mat_H_row_1 <= mat_H_row_1_2;
                    mat_H_row_2 <= mat_H_row_2_2;
                    mat_H_row_3 <= mat_H_row_3_2;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00011) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00100) begin // post_H_sum_2
                    mat_H_row_0 <= mat_H_row_0_3;
                    mat_H_row_1 <= mat_H_row_1_3;
                    mat_H_row_2 <= mat_H_row_2_3;
                    mat_H_row_3 <= mat_H_row_3_3;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00101) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00110) begin // post_H_sum_3
                    mat_H_row_0 <= mat_H_row_0_4;
                    mat_H_row_1 <= mat_H_row_1_4;
                    mat_H_row_2 <= mat_H_row_2_4;
                    mat_H_row_3 <= mat_H_row_3_4;

                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b00111) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                
                else if(counter==5'b01000) begin // post_H_sum_4
                    mat_H_row_0 <= mat_H_row_0_5;
                    mat_H_row_1 <= mat_H_row_1_5;
                    mat_H_row_2 <= mat_H_row_2_5;
                    mat_H_row_3 <= mat_H_row_3_5;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01001) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01010) begin // post_H_sum_5
                    mat_H_row_0 <= mat_H_row_0_6;
                    mat_H_row_1 <= mat_H_row_1_6;
                    mat_H_row_2 <= mat_H_row_2_6;
                    mat_H_row_3 <= mat_H_row_3_6;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01011) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01100) begin // post_H_sum_6
                    mat_H_row_0 <= mat_H_row_0_7;
                    mat_H_row_1 <= mat_H_row_1_7;
                    mat_H_row_2 <= mat_H_row_2_7;
                    mat_H_row_3 <= mat_H_row_3_7;

                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01101) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01110) begin // post_H_sum_7
                    mat_H_row_0 <= mat_H_row_0_8;
                    mat_H_row_1 <= mat_H_row_1_8;
                    mat_H_row_2 <= mat_H_row_2_8;
                    mat_H_row_3 <= mat_H_row_3_8;

                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b01111) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;                    
//                    processing <= 2'b00; // data has been processed
                end

                else if(counter==5'b10000) begin // post_H_sum_8
                    mat_H_row_0 <= mat_H_row_0_9;
                    mat_H_row_1 <= mat_H_row_1_9;
                    mat_H_row_2 <= mat_H_row_2_9;
                    mat_H_row_3 <= mat_H_row_3_9;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10001) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10010) begin // post_H_sum_9
                    mat_H_row_0 <= mat_H_row_0_10;
                    mat_H_row_1 <= mat_H_row_1_10;
                    mat_H_row_2 <= mat_H_row_2_10;
                    mat_H_row_3 <= mat_H_row_3_10;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10011) begin 
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                
                else if(counter==5'b10100) begin// post_H_sum_10
                    mat_H_row_0 <= mat_H_row_0_11;
                    mat_H_row_1 <= mat_H_row_1_11;
                    mat_H_row_2 <= mat_H_row_2_11;
                    mat_H_row_3 <= mat_H_row_3_11;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10101) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10110) begin// post_H_sum_11
                    mat_H_row_0 <= mat_H_row_0_12;
                    mat_H_row_1 <= mat_H_row_1_12;
                    mat_H_row_2 <= mat_H_row_2_12;
                    mat_H_row_3 <= mat_H_row_3_12;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b10111) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                
                else if(counter==5'b11000) begin // post_H_sum_12
                    mat_H_row_0 <= mat_H_row_0_13;
                    mat_H_row_1 <= mat_H_row_1_13;
                    mat_H_row_2 <= mat_H_row_2_13;
                    mat_H_row_3 <= mat_H_row_3_13;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11001) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11010) begin // post_H_sum_13
                    mat_H_row_0 <= mat_H_row_0_14;
                    mat_H_row_1 <= mat_H_row_1_14;
                    mat_H_row_2 <= mat_H_row_2_14;
                    mat_H_row_3 <= mat_H_row_3_14;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11011) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11100) begin // post_H_sum_14
                    mat_H_row_0 <= mat_H_row_0_15;
                    mat_H_row_1 <= mat_H_row_1_15;
                    mat_H_row_2 <= mat_H_row_2_15;
                    mat_H_row_3 <= mat_H_row_3_15;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11101) begin
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= counter + 5'b00001;
                end
                else if(counter==5'b11110) begin // post_H_sum_15
                    mat_H_row_0 <= mat_H_row_0_0;
                    mat_H_row_1 <= mat_H_row_1_0;
                    mat_H_row_2 <= mat_H_row_2_0;
                    mat_H_row_3 <= mat_H_row_3_0;
                
                    FMC_data_cable <= post_H_sum_imag;
                    FMC_isIM_cable <= 1'b1; // this is imag data
                    counter <= counter + 5'b00001;
                end
                else begin // if(counter==5'b11111)  
                    FMC_data_cable <= post_H_sum_real;
                    FMC_isIM_cable <= 1'b0; // this is real data
                    counter <= 5'b00000;                    
                    processing <= 2'b00; // data has been processed
                end
            end
            else begin // processing == 2'b00
                mat_H_row_0 <= mat_H_row_0_0;
                mat_H_row_1 <= mat_H_row_1_0;
                mat_H_row_2 <= mat_H_row_2_0;
                mat_H_row_3 <= mat_H_row_3_0;

                FMC_valid_cable <= 1'b0;
                FMC_data_cable <= 53'b0;
                FMC_isIM_cable <= 1'b0;
                FMC_ready <= 1'b1;
            end
        end
    end
endmodule


//`timescale 1ns / 1ps

//module mat_H_lookup(output reg [255:0] mat_H_row, input [1:0] h_index, input [3:0] row_index);
//    always @(*) begin
//        case({h_index,row_index})
//            6'b000000: mat_H_row <= 256'h96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888_bef06e3b_df2b7bb8;
//            6'b000001: mat_H_row <= 256'hae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888_bef06e3b;
//            6'b000010: mat_H_row <= 256'hcc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c_a38e5888;
//            6'b000011: mat_H_row <= 256'hed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74_8f0f3c3c;
//            6'b000100: mat_H_row <= 256'h108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0_82fb1b74;
//            6'b000101: mat_H_row <= 256'h32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658_8036f8a0;
//            6'b000110: mat_H_row <= 256'h50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b_86f8d658;
//            6'b000111: mat_H_row <= 256'h6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c_96bdb72b;
//            6'b001000: mat_H_row <= 256'h786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04_ae5b9d6c;
//            6'b001001: mat_H_row <= 256'h7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154_cc0d8b04;
//            6'b001010: mat_H_row <= 256'h7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113_ed9e8154;
//            6'b001011: mat_H_row <= 256'h71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48_108e8113;
//            6'b001100: mat_H_row <= 256'h5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41_32428a48;
//            6'b001101: mat_H_row <= 256'h42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa_50389c41;
//            6'b001110: mat_H_row <= 256'h229c7b3b_42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b_6834b5aa;
//            6'b001111: mat_H_row <= 256'h00007fff_229c7b3b_42a56d48_5db65731_71cc3a9b_7d6719a6_7fabf6c9_786cd49b;

//            6'b010000: mat_H_row <= 256'h70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315_30fd89bf_9904b3fc;
//            6'b010001: mat_H_row <= 256'hdede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315_30fd89bf;
//            6'b010010: mat_H_row <= 256'h8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71_7e921315;
//            6'b010011: mat_H_row <= 256'he3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45_0bf27f71;
//            6'b010100: mat_H_row <= 256'h7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9_872e2a45;
//            6'b010101: mat_H_row <= 256'h537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c_b9e494e9;
//            6'b010110: mat_H_row <= 256'hb5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec_5711a22c;
//            6'b010111: mat_H_row <= 256'h88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3_70073dec;
//            6'b011000: mat_H_row <= 256'h10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a_dede7ba3;
//            6'b011001: mat_H_row <= 256'h7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335_8006fd9a;
//            6'b011010: mat_H_row <= 256'h2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652_e3858335;
//            6'b011011: mat_H_row <= 256'h963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106_7244c652;
//            6'b011100: mat_H_row <= 256'ha08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864_537e6106;
//            6'b011101: mat_H_row <= 256'h3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c_b5ee6864;
//            6'b011110: mat_H_row <= 256'h7c3c1ed0_3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118_88d9d13c;
//            6'b011111: mat_H_row <= 256'h00007fff_7c3c1ed0_3bd08ed5_a08faab5_963e481b_2c877802_7f32f1ac_10b68118;

//            6'b100000: mat_H_row <= 256'h78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373_3a628e17_8200168b;
//            6'b100001: mat_H_row <= 256'hd84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373_3a628e17;
//            6'b100010: mat_H_row <= 256'hb74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e_37477373;
//            6'b100011: mat_H_row <= 256'h7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb_82a8e60e;
//            6'b100100: mat_H_row <= 256'hadd86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba_6091abfb;
//            6'b100101: mat_H_row <= 256'he3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b_085d7fba;
//            6'b100110: mat_H_row <= 256'h747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee_954db94b;
//            6'b100111: mat_H_row <= 256'h8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac_78e4d5ee;
//            6'b101000: mat_H_row <= 256'h14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad_d84179ac;
//            6'b101001: mat_H_row <= 256'h58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb_b74396ad;
//            6'b101010: mat_H_row <= 256'h80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228_7fdd05eb;
//            6'b101011: mat_H_row <= 256'h41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d_add86228;
//            6'b101100: mat_H_row <= 256'h2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e_e3a9832d;
//            6'b101101: mat_H_row <= 256'h849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e_747d350e;
//            6'b101110: mat_H_row <= 256'h65d9b278_849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198_8f3b3c8e;
//            6'b101111: mat_H_row <= 256'h00007fff_65d9b278_849fddeb_2f9d76d1_41b39226_80cc0e42_58655c94_14208198;

//            6'b110000: mat_H_row <= 256'h859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614_f2f880aa_e7887da4;
//            6'b110001: mat_H_row <= 256'h6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614_f2f880aa;
//            6'b110010: mat_H_row <= 256'haf086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56_316a7614;
//            6'b110011: mat_H_row <= 256'h30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4_ae759d56;
//            6'b110100: mat_H_row <= 256'hf3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39_6aa946c4;
//            6'b110101: mat_H_row <= 256'he6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1_8566db39;
//            6'b110110: mat_H_row <= 256'h3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d_8000ffa1;
//            6'b110111: mat_H_row <= 256'ha55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e_859d257d;
//            6'b111000: mat_H_row <= 256'h70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323_6a3fb89e;
//            6'b111001: mat_H_row <= 256'h826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3_af086323;
//            6'b111010: mat_H_row <= 256'h7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69_30ba89a3;
//            6'b111011: mat_H_row <= 256'h89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281_f3b57f69;
//            6'b111100: mat_H_row <= 256'h62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca_e6cd8281;
//            6'b111101: mat_H_row <= 256'hb8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f_3c8670ca;
//            6'b111110: mat_H_row <= 256'h25228581_b8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32_a55ca59f;
//            6'b111111: mat_H_row <= 256'h00007fff_25228581_b8ed6a74_62e7aebe_89c73112_7f5ff357_826fe72a_70f63c32;
//            default: mat_H_row <= 256'h00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000;
//        endcase
//    end
//endmodule

//module computeH(input clk, input reset, input [255:0] mat_H_row, input [511:0] w_tx_out, output [101:0] post_H); // each imag or real is fixed51_45
//    wire signed [15:0] H_0_imag, H_0_real, H_1_imag, H_1_real, H_2_imag, H_2_real, H_3_imag, H_3_real; 
//    wire signed [15:0] H_4_imag, H_4_real, H_5_imag, H_5_real, H_6_imag, H_6_real, H_7_imag, H_7_real;
//    wire signed [31:0] w_tx_0_imag, w_tx_0_real, w_tx_1_imag, w_tx_1_real, w_tx_2_imag, w_tx_2_real, w_tx_3_imag, w_tx_3_real;
//    wire signed [31:0] w_tx_4_imag, w_tx_4_real, w_tx_5_imag, w_tx_5_real, w_tx_6_imag, w_tx_6_real, w_tx_7_imag, w_tx_7_real;
//    reg signed [50:0] imag_part, real_part; // no overflow making sure, fixed51_45
    
//    assign {H_0_imag, H_0_real, H_1_imag, H_1_real, H_2_imag, H_2_real, H_3_imag, H_3_real, H_4_imag, H_4_real, H_5_imag, H_5_real, H_6_imag, H_6_real, H_7_imag, H_7_real} = mat_H_row;
//    assign {w_tx_0_imag, w_tx_0_real, w_tx_1_imag, w_tx_1_real, w_tx_2_imag, w_tx_2_real, w_tx_3_imag, w_tx_3_real, w_tx_4_imag, w_tx_4_real, w_tx_5_imag, w_tx_5_real, w_tx_6_imag, w_tx_6_real, w_tx_7_imag, w_tx_7_real} = w_tx_out;
    
//    always@(posedge clk) begin
//        if(reset) begin
//            imag_part <= 0;
//            real_part <= 0;
//        end
//        else begin
//            imag_part <= (H_0_real*w_tx_0_imag + H_0_imag*w_tx_0_real) + (H_1_real*w_tx_1_imag + H_1_imag*w_tx_1_real) + (H_2_real*w_tx_2_imag + H_2_imag*w_tx_2_real) + (H_3_real*w_tx_3_imag + H_3_imag*w_tx_3_real) + 
//                (H_4_real*w_tx_4_imag + H_4_imag*w_tx_4_real) + (H_5_real*w_tx_5_imag + H_5_imag*w_tx_5_real) + (H_6_real*w_tx_6_imag + H_6_imag*w_tx_6_real) + (H_7_real*w_tx_7_imag + H_7_imag*w_tx_7_real);
//            real_part <= (H_0_real*w_tx_0_real - H_0_imag*w_tx_0_imag) + (H_1_real*w_tx_1_real - H_1_imag*w_tx_1_imag) + (H_2_real*w_tx_2_real - H_2_imag*w_tx_2_imag) + (H_3_real*w_tx_3_real - H_3_imag*w_tx_3_imag) + 
//                (H_4_real*w_tx_4_real - H_4_imag*w_tx_4_imag) + (H_5_real*w_tx_5_real - H_5_imag*w_tx_5_imag) + (H_6_real*w_tx_6_real - H_6_imag*w_tx_6_imag) + (H_7_real*w_tx_7_real - H_7_imag*w_tx_7_imag);    
//        end
//    end
//    assign post_H = {imag_part,real_part};
//endmodule

//module applyH(input clk, input reset,
//    input [511:0] w_tx_out_0, // each imag or real is fixed32_30
//    input [511:0] w_tx_out_1, 
//    input [511:0] w_tx_out_2, 
//    input [511:0] w_tx_out_3,
//    input FMC_valid,
//    input FMC_isIM,
//    output reg FMC_ready,
//    output reg FMC_valid_cable,
//    output reg FMC_isIM_cable,
//    input FMC_ready_cable,
//    output reg [52:0] FMC_data_cable); // each data is 
    
//    wire [255:0] mat_H_row_0_0, mat_H_row_0_1, mat_H_row_0_2, mat_H_row_0_3, mat_H_row_0_4, mat_H_row_0_5, mat_H_row_0_6, mat_H_row_0_7,
//        mat_H_row_0_8, mat_H_row_0_9, mat_H_row_0_10, mat_H_row_0_11, mat_H_row_0_12, mat_H_row_0_13, mat_H_row_0_14, mat_H_row_0_15;
//    wire [255:0] mat_H_row_1_0, mat_H_row_1_1, mat_H_row_1_2, mat_H_row_1_3, mat_H_row_1_4, mat_H_row_1_5, mat_H_row_1_6, mat_H_row_1_7, 
//        mat_H_row_1_8, mat_H_row_1_9, mat_H_row_1_10, mat_H_row_1_11, mat_H_row_1_12, mat_H_row_1_13, mat_H_row_1_14, mat_H_row_1_15;
//    wire [255:0] mat_H_row_2_0, mat_H_row_2_1, mat_H_row_2_2, mat_H_row_2_3, mat_H_row_2_4, mat_H_row_2_5, mat_H_row_2_6, mat_H_row_2_7, 
//        mat_H_row_2_8, mat_H_row_2_9, mat_H_row_2_10, mat_H_row_2_11, mat_H_row_2_12, mat_H_row_2_13, mat_H_row_2_14, mat_H_row_2_15;
//    wire [255:0] mat_H_row_3_0, mat_H_row_3_1, mat_H_row_3_2, mat_H_row_3_3, mat_H_row_3_4, mat_H_row_3_5, mat_H_row_3_6, mat_H_row_3_7, 
//        mat_H_row_3_8, mat_H_row_3_9, mat_H_row_3_10, mat_H_row_3_11, mat_H_row_3_12, mat_H_row_3_13, mat_H_row_3_14, mat_H_row_3_15;

//    wire [101:0] post_H_0_0, post_H_0_1, post_H_0_2, post_H_0_3, post_H_0_4, post_H_0_5, post_H_0_6, post_H_0_7, 
//        post_H_0_8, post_H_0_9, post_H_0_10, post_H_0_11, post_H_0_12, post_H_0_13, post_H_0_14, post_H_0_15;
//    wire [101:0] post_H_1_0, post_H_1_1, post_H_1_2, post_H_1_3, post_H_1_4, post_H_1_5, post_H_1_6, post_H_1_7, 
//        post_H_1_8, post_H_1_9, post_H_1_10, post_H_1_11, post_H_1_12, post_H_1_13, post_H_1_14, post_H_1_15;
//    wire [101:0] post_H_2_0, post_H_2_1, post_H_2_2, post_H_2_3, post_H_2_4, post_H_2_5, post_H_2_6, post_H_2_7, 
//        post_H_2_8, post_H_2_9, post_H_2_10, post_H_2_11, post_H_2_12, post_H_2_13, post_H_2_14, post_H_2_15;
//    wire [101:0] post_H_3_0, post_H_3_1, post_H_3_2, post_H_3_3, post_H_3_4, post_H_3_5, post_H_3_6, post_H_3_7, 
//        post_H_3_8, post_H_3_9, post_H_3_10, post_H_3_11, post_H_3_12, post_H_3_13, post_H_3_14, post_H_3_15;

//    wire signed [50:0] post_H_0_0_imag, post_H_0_1_imag, post_H_0_2_imag, post_H_0_3_imag, post_H_0_4_imag, post_H_0_5_imag, post_H_0_6_imag, post_H_0_7_imag, 
//        post_H_0_8_imag, post_H_0_9_imag, post_H_0_10_imag, post_H_0_11_imag, post_H_0_12_imag, post_H_0_13_imag, post_H_0_14_imag, post_H_0_15_imag;
//    wire signed [50:0] post_H_1_0_imag, post_H_1_1_imag, post_H_1_2_imag, post_H_1_3_imag, post_H_1_4_imag, post_H_1_5_imag, post_H_1_6_imag, post_H_1_7_imag, 
//        post_H_1_8_imag, post_H_1_9_imag, post_H_1_10_imag, post_H_1_11_imag, post_H_1_12_imag, post_H_1_13_imag, post_H_1_14_imag, post_H_1_15_imag;
//    wire signed [50:0] post_H_2_0_imag, post_H_2_1_imag, post_H_2_2_imag, post_H_2_3_imag, post_H_2_4_imag, post_H_2_5_imag, post_H_2_6_imag, post_H_2_7_imag, 
//        post_H_2_8_imag, post_H_2_9_imag, post_H_2_10_imag, post_H_2_11_imag, post_H_2_12_imag, post_H_2_13_imag, post_H_2_14_imag, post_H_2_15_imag;
//    wire signed [50:0] post_H_3_0_imag, post_H_3_1_imag, post_H_3_2_imag, post_H_3_3_imag, post_H_3_4_imag, post_H_3_5_imag, post_H_3_6_imag, post_H_3_7_imag, 
//        post_H_3_8_imag, post_H_3_9_imag, post_H_3_10_imag, post_H_3_11_imag, post_H_3_12_imag, post_H_3_13_imag, post_H_3_14_imag, post_H_3_15_imag;

//    wire signed [50:0] post_H_0_0_real, post_H_0_1_real, post_H_0_2_real, post_H_0_3_real, post_H_0_4_real, post_H_0_5_real, post_H_0_6_real, post_H_0_7_real, 
//        post_H_0_8_real, post_H_0_9_real, post_H_0_10_real, post_H_0_11_real, post_H_0_12_real, post_H_0_13_real, post_H_0_14_real, post_H_0_15_real;
//    wire signed [50:0] post_H_1_0_real, post_H_1_1_real, post_H_1_2_real, post_H_1_3_real, post_H_1_4_real, post_H_1_5_real, post_H_1_6_real, post_H_1_7_real, 
//        post_H_1_8_real, post_H_1_9_real, post_H_1_10_real, post_H_1_11_real, post_H_1_12_real, post_H_1_13_real, post_H_1_14_real, post_H_1_15_real;
//    wire signed [50:0] post_H_2_0_real, post_H_2_1_real, post_H_2_2_real, post_H_2_3_real, post_H_2_4_real, post_H_2_5_real, post_H_2_6_real, post_H_2_7_real, 
//        post_H_2_8_real, post_H_2_9_real, post_H_2_10_real, post_H_2_11_real, post_H_2_12_real, post_H_2_13_real, post_H_2_14_real, post_H_2_15_real;
//    wire signed [50:0] post_H_3_0_real, post_H_3_1_real, post_H_3_2_real, post_H_3_3_real, post_H_3_4_real, post_H_3_5_real, post_H_3_6_real, post_H_3_7_real, 
//        post_H_3_8_real, post_H_3_9_real, post_H_3_10_real, post_H_3_11_real, post_H_3_12_real, post_H_3_13_real, post_H_3_14_real, post_H_3_15_real;

//    wire [105:0] post_H_sum_0, post_H_sum_1, post_H_sum_2, post_H_sum_3, post_H_sum_4, post_H_sum_5, post_H_sum_6, post_H_sum_7, 
//        post_H_sum_8, post_H_sum_9, post_H_sum_10, post_H_sum_11, post_H_sum_12, post_H_sum_13, post_H_sum_14, post_H_sum_15;

//    assign {post_H_0_0_imag, post_H_0_0_real} = post_H_0_0;
//    assign {post_H_0_1_imag, post_H_0_1_real} = post_H_0_1;
//    assign {post_H_0_2_imag, post_H_0_2_real} = post_H_0_2;
//    assign {post_H_0_3_imag, post_H_0_3_real} = post_H_0_3;
//    assign {post_H_0_4_imag, post_H_0_4_real} = post_H_0_4;
//    assign {post_H_0_5_imag, post_H_0_5_real} = post_H_0_5;
//    assign {post_H_0_6_imag, post_H_0_6_real} = post_H_0_6;
//    assign {post_H_0_7_imag, post_H_0_7_real} = post_H_0_7;
//    assign {post_H_0_8_imag, post_H_0_8_real} = post_H_0_8;
//    assign {post_H_0_9_imag, post_H_0_9_real} = post_H_0_9;
//    assign {post_H_0_10_imag, post_H_0_10_real} = post_H_0_10;
//    assign {post_H_0_11_imag, post_H_0_11_real} = post_H_0_11;
//    assign {post_H_0_12_imag, post_H_0_12_real} = post_H_0_12;
//    assign {post_H_0_13_imag, post_H_0_13_real} = post_H_0_13;
//    assign {post_H_0_14_imag, post_H_0_14_real} = post_H_0_14;
//    assign {post_H_0_15_imag, post_H_0_15_real} = post_H_0_15;
//    assign {post_H_1_0_imag, post_H_1_0_real} = post_H_1_0;
//    assign {post_H_1_1_imag, post_H_1_1_real} = post_H_1_1;
//    assign {post_H_1_2_imag, post_H_1_2_real} = post_H_1_2;
//    assign {post_H_1_3_imag, post_H_1_3_real} = post_H_1_3;
//    assign {post_H_1_4_imag, post_H_1_4_real} = post_H_1_4;
//    assign {post_H_1_5_imag, post_H_1_5_real} = post_H_1_5;
//    assign {post_H_1_6_imag, post_H_1_6_real} = post_H_1_6;
//    assign {post_H_1_7_imag, post_H_1_7_real} = post_H_1_7;
//    assign {post_H_1_8_imag, post_H_1_8_real} = post_H_1_8;
//    assign {post_H_1_9_imag, post_H_1_9_real} = post_H_1_9;
//    assign {post_H_1_10_imag, post_H_1_10_real} = post_H_1_10;
//    assign {post_H_1_11_imag, post_H_1_11_real} = post_H_1_11;
//    assign {post_H_1_12_imag, post_H_1_12_real} = post_H_1_12;
//    assign {post_H_1_13_imag, post_H_1_13_real} = post_H_1_13;
//    assign {post_H_1_14_imag, post_H_1_14_real} = post_H_1_14;
//    assign {post_H_1_15_imag, post_H_1_15_real} = post_H_1_15;
//    assign {post_H_2_0_imag, post_H_2_0_real} = post_H_2_0;
//    assign {post_H_2_1_imag, post_H_2_1_real} = post_H_2_1;
//    assign {post_H_2_2_imag, post_H_2_2_real} = post_H_2_2;
//    assign {post_H_2_3_imag, post_H_2_3_real} = post_H_2_3;
//    assign {post_H_2_4_imag, post_H_2_4_real} = post_H_2_4;
//    assign {post_H_2_5_imag, post_H_2_5_real} = post_H_2_5;
//    assign {post_H_2_6_imag, post_H_2_6_real} = post_H_2_6;
//    assign {post_H_2_7_imag, post_H_2_7_real} = post_H_2_7;
//    assign {post_H_2_8_imag, post_H_2_8_real} = post_H_2_8;
//    assign {post_H_2_9_imag, post_H_2_9_real} = post_H_2_9;
//    assign {post_H_2_10_imag, post_H_2_10_real} = post_H_2_10;
//    assign {post_H_2_11_imag, post_H_2_11_real} = post_H_2_11;
//    assign {post_H_2_12_imag, post_H_2_12_real} = post_H_2_12;
//    assign {post_H_2_13_imag, post_H_2_13_real} = post_H_2_13;
//    assign {post_H_2_14_imag, post_H_2_14_real} = post_H_2_14;
//    assign {post_H_2_15_imag, post_H_2_15_real} = post_H_2_15;
//    assign {post_H_3_0_imag, post_H_3_0_real} = post_H_3_0;
//    assign {post_H_3_1_imag, post_H_3_1_real} = post_H_3_1;
//    assign {post_H_3_2_imag, post_H_3_2_real} = post_H_3_2;
//    assign {post_H_3_3_imag, post_H_3_3_real} = post_H_3_3;
//    assign {post_H_3_4_imag, post_H_3_4_real} = post_H_3_4;
//    assign {post_H_3_5_imag, post_H_3_5_real} = post_H_3_5;
//    assign {post_H_3_6_imag, post_H_3_6_real} = post_H_3_6;
//    assign {post_H_3_7_imag, post_H_3_7_real} = post_H_3_7;
//    assign {post_H_3_8_imag, post_H_3_8_real} = post_H_3_8;
//    assign {post_H_3_9_imag, post_H_3_9_real} = post_H_3_9;
//    assign {post_H_3_10_imag, post_H_3_10_real} = post_H_3_10;
//    assign {post_H_3_11_imag, post_H_3_11_real} = post_H_3_11;
//    assign {post_H_3_12_imag, post_H_3_12_real} = post_H_3_12;
//    assign {post_H_3_13_imag, post_H_3_13_real} = post_H_3_13;
//    assign {post_H_3_14_imag, post_H_3_14_real} = post_H_3_14;
//    assign {post_H_3_15_imag, post_H_3_15_real} = post_H_3_15;
    
//    wire signed [52:0] post_H_sum_0_imag, post_H_sum_0_real, post_H_sum_1_imag, post_H_sum_1_real, post_H_sum_2_imag, post_H_sum_2_real, post_H_sum_3_imag, post_H_sum_3_real, 
//        post_H_sum_4_imag, post_H_sum_4_real, post_H_sum_5_imag, post_H_sum_5_real, post_H_sum_6_imag, post_H_sum_6_real, post_H_sum_7_imag, post_H_sum_7_real, 
//        post_H_sum_8_imag, post_H_sum_8_real, post_H_sum_9_imag, post_H_sum_9_real, post_H_sum_10_imag, post_H_sum_10_real, post_H_sum_11_imag, post_H_sum_11_real, 
//        post_H_sum_12_imag, post_H_sum_12_real, post_H_sum_13_imag, post_H_sum_13_real, post_H_sum_14_imag, post_H_sum_14_real, post_H_sum_15_imag, post_H_sum_15_real;
    
//    assign post_H_sum_0_imag = post_H_0_0_imag + post_H_1_0_imag + post_H_2_0_imag + post_H_3_0_imag;
//    assign post_H_sum_0_real = post_H_0_0_real + post_H_1_0_real + post_H_2_0_real + post_H_3_0_real;
//    assign post_H_sum_1_imag = post_H_0_1_imag + post_H_1_1_imag + post_H_2_1_imag + post_H_3_1_imag;
//    assign post_H_sum_1_real = post_H_0_1_real + post_H_1_1_real + post_H_2_1_real + post_H_3_1_real;
//    assign post_H_sum_2_imag = post_H_0_2_imag + post_H_1_2_imag + post_H_2_2_imag + post_H_3_2_imag;
//    assign post_H_sum_2_real = post_H_0_2_real + post_H_1_2_real + post_H_2_2_real + post_H_3_2_real;
//    assign post_H_sum_3_imag = post_H_0_3_imag + post_H_1_3_imag + post_H_2_3_imag + post_H_3_3_imag;
//    assign post_H_sum_3_real = post_H_0_3_real + post_H_1_3_real + post_H_2_3_real + post_H_3_3_real;
//    assign post_H_sum_4_imag = post_H_0_4_imag + post_H_1_4_imag + post_H_2_4_imag + post_H_3_4_imag;
//    assign post_H_sum_4_real = post_H_0_4_real + post_H_1_4_real + post_H_2_4_real + post_H_3_4_real;
//    assign post_H_sum_5_imag = post_H_0_5_imag + post_H_1_5_imag + post_H_2_5_imag + post_H_3_5_imag;
//    assign post_H_sum_5_real = post_H_0_5_real + post_H_1_5_real + post_H_2_5_real + post_H_3_5_real;
//    assign post_H_sum_6_imag = post_H_0_6_imag + post_H_1_6_imag + post_H_2_6_imag + post_H_3_6_imag;
//    assign post_H_sum_6_real = post_H_0_6_real + post_H_1_6_real + post_H_2_6_real + post_H_3_6_real;
//    assign post_H_sum_7_imag = post_H_0_7_imag + post_H_1_7_imag + post_H_2_7_imag + post_H_3_7_imag;
//    assign post_H_sum_7_real = post_H_0_7_real + post_H_1_7_real + post_H_2_7_real + post_H_3_7_real;
//    assign post_H_sum_8_imag = post_H_0_8_imag + post_H_1_8_imag + post_H_2_8_imag + post_H_3_8_imag;
//    assign post_H_sum_8_real = post_H_0_8_real + post_H_1_8_real + post_H_2_8_real + post_H_3_8_real;
//    assign post_H_sum_9_imag = post_H_0_9_imag + post_H_1_9_imag + post_H_2_9_imag + post_H_3_9_imag;
//    assign post_H_sum_9_real = post_H_0_9_real + post_H_1_9_real + post_H_2_9_real + post_H_3_9_real;
//    assign post_H_sum_10_imag = post_H_0_10_imag + post_H_1_10_imag + post_H_2_10_imag + post_H_3_10_imag;
//    assign post_H_sum_10_real = post_H_0_10_real + post_H_1_10_real + post_H_2_10_real + post_H_3_10_real;
//    assign post_H_sum_11_imag = post_H_0_11_imag + post_H_1_11_imag + post_H_2_11_imag + post_H_3_11_imag;
//    assign post_H_sum_11_real = post_H_0_11_real + post_H_1_11_real + post_H_2_11_real + post_H_3_11_real;
//    assign post_H_sum_12_imag = post_H_0_12_imag + post_H_1_12_imag + post_H_2_12_imag + post_H_3_12_imag;
//    assign post_H_sum_12_real = post_H_0_12_real + post_H_1_12_real + post_H_2_12_real + post_H_3_12_real;
//    assign post_H_sum_13_imag = post_H_0_13_imag + post_H_1_13_imag + post_H_2_13_imag + post_H_3_13_imag;
//    assign post_H_sum_13_real = post_H_0_13_real + post_H_1_13_real + post_H_2_13_real + post_H_3_13_real;
//    assign post_H_sum_14_imag = post_H_0_14_imag + post_H_1_14_imag + post_H_2_14_imag + post_H_3_14_imag;
//    assign post_H_sum_14_real = post_H_0_14_real + post_H_1_14_real + post_H_2_14_real + post_H_3_14_real;
//    assign post_H_sum_15_imag = post_H_0_15_imag + post_H_1_15_imag + post_H_2_15_imag + post_H_3_15_imag;
//    assign post_H_sum_15_real = post_H_0_15_real + post_H_1_15_real + post_H_2_15_real + post_H_3_15_real;

        
//    // post_H_0_0_imag is fixed51_45, so post_H_sum_0's imag should be fixed53_45
//    assign post_H_sum_0 = {post_H_sum_0_imag,post_H_sum_0_real};
//    assign post_H_sum_1 = {post_H_sum_1_imag,post_H_sum_1_real};
//    assign post_H_sum_2 = {post_H_sum_2_imag,post_H_sum_2_real};
//    assign post_H_sum_3 = {post_H_sum_3_imag,post_H_sum_3_real};
//    assign post_H_sum_4 = {post_H_sum_4_imag,post_H_sum_4_real};
//    assign post_H_sum_5 = {post_H_sum_5_imag,post_H_sum_5_real};
//    assign post_H_sum_6 = {post_H_sum_6_imag,post_H_sum_6_real};
//    assign post_H_sum_7 = {post_H_sum_7_imag,post_H_sum_7_real};
//    assign post_H_sum_8 = {post_H_sum_8_imag,post_H_sum_8_real};
//    assign post_H_sum_9 = {post_H_sum_9_imag,post_H_sum_9_real};
//    assign post_H_sum_10 = {post_H_sum_10_imag,post_H_sum_10_real};
//    assign post_H_sum_11 = {post_H_sum_11_imag,post_H_sum_11_real};
//    assign post_H_sum_12 = {post_H_sum_12_imag,post_H_sum_12_real};
//    assign post_H_sum_13 = {post_H_sum_13_imag,post_H_sum_13_real};
//    assign post_H_sum_14 = {post_H_sum_14_imag,post_H_sum_14_real};
//    assign post_H_sum_15 = {post_H_sum_15_imag,post_H_sum_15_real};

//    mat_H_lookup mHl_0_0(.mat_H_row(mat_H_row_0_0), .h_index(2'b00), .row_index(4'b0000));
//    mat_H_lookup mHl_0_1(.mat_H_row(mat_H_row_0_1), .h_index(2'b00), .row_index(4'b0001));
//    mat_H_lookup mHl_0_2(.mat_H_row(mat_H_row_0_2), .h_index(2'b00), .row_index(4'b0010));
//    mat_H_lookup mHl_0_3(.mat_H_row(mat_H_row_0_3), .h_index(2'b00), .row_index(4'b0011));
//    mat_H_lookup mHl_0_4(.mat_H_row(mat_H_row_0_4), .h_index(2'b00), .row_index(4'b0100));
//    mat_H_lookup mHl_0_5(.mat_H_row(mat_H_row_0_5), .h_index(2'b00), .row_index(4'b0101));
//    mat_H_lookup mHl_0_6(.mat_H_row(mat_H_row_0_6), .h_index(2'b00), .row_index(4'b0110));
//    mat_H_lookup mHl_0_7(.mat_H_row(mat_H_row_0_7), .h_index(2'b00), .row_index(4'b0111));
//    mat_H_lookup mHl_0_8(.mat_H_row(mat_H_row_0_8), .h_index(2'b00), .row_index(4'b1000));
//    mat_H_lookup mHl_0_9(.mat_H_row(mat_H_row_0_9), .h_index(2'b00), .row_index(4'b1001));
//    mat_H_lookup mHl_0_10(.mat_H_row(mat_H_row_0_10), .h_index(2'b00), .row_index(4'b1010));
//    mat_H_lookup mHl_0_11(.mat_H_row(mat_H_row_0_11), .h_index(2'b00), .row_index(4'b1011));
//    mat_H_lookup mHl_0_12(.mat_H_row(mat_H_row_0_12), .h_index(2'b00), .row_index(4'b1100));
//    mat_H_lookup mHl_0_13(.mat_H_row(mat_H_row_0_13), .h_index(2'b00), .row_index(4'b1101));
//    mat_H_lookup mHl_0_14(.mat_H_row(mat_H_row_0_14), .h_index(2'b00), .row_index(4'b1110));
//    mat_H_lookup mHl_0_15(.mat_H_row(mat_H_row_0_15), .h_index(2'b00), .row_index(4'b1111));

//    mat_H_lookup mHl_1_0(.mat_H_row(mat_H_row_1_0), .h_index(2'b01), .row_index(4'b0000));
//    mat_H_lookup mHl_1_1(.mat_H_row(mat_H_row_1_1), .h_index(2'b01), .row_index(4'b0001));
//    mat_H_lookup mHl_1_2(.mat_H_row(mat_H_row_1_2), .h_index(2'b01), .row_index(4'b0010));
//    mat_H_lookup mHl_1_3(.mat_H_row(mat_H_row_1_3), .h_index(2'b01), .row_index(4'b0011));
//    mat_H_lookup mHl_1_4(.mat_H_row(mat_H_row_1_4), .h_index(2'b01), .row_index(4'b0100));
//    mat_H_lookup mHl_1_5(.mat_H_row(mat_H_row_1_5), .h_index(2'b01), .row_index(4'b0101));
//    mat_H_lookup mHl_1_6(.mat_H_row(mat_H_row_1_6), .h_index(2'b01), .row_index(4'b0110));
//    mat_H_lookup mHl_1_7(.mat_H_row(mat_H_row_1_7), .h_index(2'b01), .row_index(4'b0111));
//    mat_H_lookup mHl_1_8(.mat_H_row(mat_H_row_1_8), .h_index(2'b01), .row_index(4'b1000));
//    mat_H_lookup mHl_1_9(.mat_H_row(mat_H_row_1_9), .h_index(2'b01), .row_index(4'b1001));
//    mat_H_lookup mHl_1_10(.mat_H_row(mat_H_row_1_10), .h_index(2'b01), .row_index(4'b1010));
//    mat_H_lookup mHl_1_11(.mat_H_row(mat_H_row_1_11), .h_index(2'b01), .row_index(4'b1011));
//    mat_H_lookup mHl_1_12(.mat_H_row(mat_H_row_1_12), .h_index(2'b01), .row_index(4'b1100));
//    mat_H_lookup mHl_1_13(.mat_H_row(mat_H_row_1_13), .h_index(2'b01), .row_index(4'b1101));
//    mat_H_lookup mHl_1_14(.mat_H_row(mat_H_row_1_14), .h_index(2'b01), .row_index(4'b1110));
//    mat_H_lookup mHl_1_15(.mat_H_row(mat_H_row_1_15), .h_index(2'b01), .row_index(4'b1111));

//    mat_H_lookup mHl_2_0(.mat_H_row(mat_H_row_2_0), .h_index(2'b10), .row_index(4'b0000));
//    mat_H_lookup mHl_2_1(.mat_H_row(mat_H_row_2_1), .h_index(2'b10), .row_index(4'b0001));
//    mat_H_lookup mHl_2_2(.mat_H_row(mat_H_row_2_2), .h_index(2'b10), .row_index(4'b0010));
//    mat_H_lookup mHl_2_3(.mat_H_row(mat_H_row_2_3), .h_index(2'b10), .row_index(4'b0011));
//    mat_H_lookup mHl_2_4(.mat_H_row(mat_H_row_2_4), .h_index(2'b10), .row_index(4'b0100));
//    mat_H_lookup mHl_2_5(.mat_H_row(mat_H_row_2_5), .h_index(2'b10), .row_index(4'b0101));
//    mat_H_lookup mHl_2_6(.mat_H_row(mat_H_row_2_6), .h_index(2'b10), .row_index(4'b0110));
//    mat_H_lookup mHl_2_7(.mat_H_row(mat_H_row_2_7), .h_index(2'b10), .row_index(4'b0111));
//    mat_H_lookup mHl_2_8(.mat_H_row(mat_H_row_2_8), .h_index(2'b10), .row_index(4'b1000));
//    mat_H_lookup mHl_2_9(.mat_H_row(mat_H_row_2_9), .h_index(2'b10), .row_index(4'b1001));
//    mat_H_lookup mHl_2_10(.mat_H_row(mat_H_row_2_10), .h_index(2'b10), .row_index(4'b1010));
//    mat_H_lookup mHl_2_11(.mat_H_row(mat_H_row_2_11), .h_index(2'b10), .row_index(4'b1011));
//    mat_H_lookup mHl_2_12(.mat_H_row(mat_H_row_2_12), .h_index(2'b10), .row_index(4'b1100));
//    mat_H_lookup mHl_2_13(.mat_H_row(mat_H_row_2_13), .h_index(2'b10), .row_index(4'b1101));
//    mat_H_lookup mHl_2_14(.mat_H_row(mat_H_row_2_14), .h_index(2'b10), .row_index(4'b1110));
//    mat_H_lookup mHl_2_15(.mat_H_row(mat_H_row_2_15), .h_index(2'b10), .row_index(4'b1111));

//    mat_H_lookup mHl_3_0(.mat_H_row(mat_H_row_3_0), .h_index(2'b11), .row_index(4'b0000));
//    mat_H_lookup mHl_3_1(.mat_H_row(mat_H_row_3_1), .h_index(2'b11), .row_index(4'b0001));
//    mat_H_lookup mHl_3_2(.mat_H_row(mat_H_row_3_2), .h_index(2'b11), .row_index(4'b0010));
//    mat_H_lookup mHl_3_3(.mat_H_row(mat_H_row_3_3), .h_index(2'b11), .row_index(4'b0011));
//    mat_H_lookup mHl_3_4(.mat_H_row(mat_H_row_3_4), .h_index(2'b11), .row_index(4'b0100));
//    mat_H_lookup mHl_3_5(.mat_H_row(mat_H_row_3_5), .h_index(2'b11), .row_index(4'b0101));
//    mat_H_lookup mHl_3_6(.mat_H_row(mat_H_row_3_6), .h_index(2'b11), .row_index(4'b0110));
//    mat_H_lookup mHl_3_7(.mat_H_row(mat_H_row_3_7), .h_index(2'b11), .row_index(4'b0111));
//    mat_H_lookup mHl_3_8(.mat_H_row(mat_H_row_3_8), .h_index(2'b11), .row_index(4'b1000));
//    mat_H_lookup mHl_3_9(.mat_H_row(mat_H_row_3_9), .h_index(2'b11), .row_index(4'b1001));
//    mat_H_lookup mHl_3_10(.mat_H_row(mat_H_row_3_10), .h_index(2'b11), .row_index(4'b1010));
//    mat_H_lookup mHl_3_11(.mat_H_row(mat_H_row_3_11), .h_index(2'b11), .row_index(4'b1011));
//    mat_H_lookup mHl_3_12(.mat_H_row(mat_H_row_3_12), .h_index(2'b11), .row_index(4'b1100));
//    mat_H_lookup mHl_3_13(.mat_H_row(mat_H_row_3_13), .h_index(2'b11), .row_index(4'b1101));
//    mat_H_lookup mHl_3_14(.mat_H_row(mat_H_row_3_14), .h_index(2'b11), .row_index(4'b1110));
//    mat_H_lookup mHl_3_15(.mat_H_row(mat_H_row_3_15), .h_index(2'b11), .row_index(4'b1111));

    
//    computeH ch_0_0(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_0), .w_tx_out(w_tx_out_0), .post_H(post_H_0_0));
//    computeH ch_0_1(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_1), .w_tx_out(w_tx_out_0), .post_H(post_H_0_1));
//    computeH ch_0_2(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_2), .w_tx_out(w_tx_out_0), .post_H(post_H_0_2));
//    computeH ch_0_3(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_3), .w_tx_out(w_tx_out_0), .post_H(post_H_0_3));
//    computeH ch_0_4(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_4), .w_tx_out(w_tx_out_0), .post_H(post_H_0_4));
//    computeH ch_0_5(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_5), .w_tx_out(w_tx_out_0), .post_H(post_H_0_5));
//    computeH ch_0_6(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_6), .w_tx_out(w_tx_out_0), .post_H(post_H_0_6));
//    computeH ch_0_7(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_7), .w_tx_out(w_tx_out_0), .post_H(post_H_0_7));
//    computeH ch_0_8(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_8), .w_tx_out(w_tx_out_0), .post_H(post_H_0_8));
//    computeH ch_0_9(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_9), .w_tx_out(w_tx_out_0), .post_H(post_H_0_9));
//    computeH ch_0_10(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_10), .w_tx_out(w_tx_out_0), .post_H(post_H_0_10));
//    computeH ch_0_11(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_11), .w_tx_out(w_tx_out_0), .post_H(post_H_0_11));
//    computeH ch_0_12(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_12), .w_tx_out(w_tx_out_0), .post_H(post_H_0_12));
//    computeH ch_0_13(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_13), .w_tx_out(w_tx_out_0), .post_H(post_H_0_13));
//    computeH ch_0_14(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_14), .w_tx_out(w_tx_out_0), .post_H(post_H_0_14));
//    computeH ch_0_15(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_0_15), .w_tx_out(w_tx_out_0), .post_H(post_H_0_15));

//    computeH ch_1_0(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_0), .w_tx_out(w_tx_out_1), .post_H(post_H_1_0));
//    computeH ch_1_1(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_1), .w_tx_out(w_tx_out_1), .post_H(post_H_1_1));
//    computeH ch_1_2(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_2), .w_tx_out(w_tx_out_1), .post_H(post_H_1_2));
//    computeH ch_1_3(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_3), .w_tx_out(w_tx_out_1), .post_H(post_H_1_3));
//    computeH ch_1_4(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_4), .w_tx_out(w_tx_out_1), .post_H(post_H_1_4));
//    computeH ch_1_5(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_5), .w_tx_out(w_tx_out_1), .post_H(post_H_1_5));
//    computeH ch_1_6(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_6), .w_tx_out(w_tx_out_1), .post_H(post_H_1_6));
//    computeH ch_1_7(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_7), .w_tx_out(w_tx_out_1), .post_H(post_H_1_7));
//    computeH ch_1_8(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_8), .w_tx_out(w_tx_out_1), .post_H(post_H_1_8));
//    computeH ch_1_9(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_9), .w_tx_out(w_tx_out_1), .post_H(post_H_1_9));
//    computeH ch_1_10(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_10), .w_tx_out(w_tx_out_1), .post_H(post_H_1_10));
//    computeH ch_1_11(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_11), .w_tx_out(w_tx_out_1), .post_H(post_H_1_11));
//    computeH ch_1_12(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_12), .w_tx_out(w_tx_out_1), .post_H(post_H_1_12));
//    computeH ch_1_13(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_13), .w_tx_out(w_tx_out_1), .post_H(post_H_1_13));
//    computeH ch_1_14(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_14), .w_tx_out(w_tx_out_1), .post_H(post_H_1_14));
//    computeH ch_1_15(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_1_15), .w_tx_out(w_tx_out_1), .post_H(post_H_1_15));

//    computeH ch_2_0(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_0), .w_tx_out(w_tx_out_2), .post_H(post_H_2_0));
//    computeH ch_2_1(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_1), .w_tx_out(w_tx_out_2), .post_H(post_H_2_1));
//    computeH ch_2_2(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_2), .w_tx_out(w_tx_out_2), .post_H(post_H_2_2));
//    computeH ch_2_3(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_3), .w_tx_out(w_tx_out_2), .post_H(post_H_2_3));
//    computeH ch_2_4(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_4), .w_tx_out(w_tx_out_2), .post_H(post_H_2_4));
//    computeH ch_2_5(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_5), .w_tx_out(w_tx_out_2), .post_H(post_H_2_5));
//    computeH ch_2_6(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_6), .w_tx_out(w_tx_out_2), .post_H(post_H_2_6));
//    computeH ch_2_7(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_7), .w_tx_out(w_tx_out_2), .post_H(post_H_2_7));
//    computeH ch_2_8(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_8), .w_tx_out(w_tx_out_2), .post_H(post_H_2_8));
//    computeH ch_2_9(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_9), .w_tx_out(w_tx_out_2), .post_H(post_H_2_9));
//    computeH ch_2_10(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_10), .w_tx_out(w_tx_out_2), .post_H(post_H_2_10));
//    computeH ch_2_11(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_11), .w_tx_out(w_tx_out_2), .post_H(post_H_2_11));
//    computeH ch_2_12(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_12), .w_tx_out(w_tx_out_2), .post_H(post_H_2_12));
//    computeH ch_2_13(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_13), .w_tx_out(w_tx_out_2), .post_H(post_H_2_13));
//    computeH ch_2_14(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_14), .w_tx_out(w_tx_out_2), .post_H(post_H_2_14));
//    computeH ch_2_15(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_2_15), .w_tx_out(w_tx_out_2), .post_H(post_H_2_15));

//    computeH ch_3_0(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_0), .w_tx_out(w_tx_out_3), .post_H(post_H_3_0));
//    computeH ch_3_1(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_1), .w_tx_out(w_tx_out_3), .post_H(post_H_3_1));
//    computeH ch_3_2(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_2), .w_tx_out(w_tx_out_3), .post_H(post_H_3_2));
//    computeH ch_3_3(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_3), .w_tx_out(w_tx_out_3), .post_H(post_H_3_3));
//    computeH ch_3_4(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_4), .w_tx_out(w_tx_out_3), .post_H(post_H_3_4));
//    computeH ch_3_5(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_5), .w_tx_out(w_tx_out_3), .post_H(post_H_3_5));
//    computeH ch_3_6(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_6), .w_tx_out(w_tx_out_3), .post_H(post_H_3_6));
//    computeH ch_3_7(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_7), .w_tx_out(w_tx_out_3), .post_H(post_H_3_7));
//    computeH ch_3_8(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_8), .w_tx_out(w_tx_out_3), .post_H(post_H_3_8));
//    computeH ch_3_9(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_9), .w_tx_out(w_tx_out_3), .post_H(post_H_3_9));
//    computeH ch_3_10(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_10), .w_tx_out(w_tx_out_3), .post_H(post_H_3_10));
//    computeH ch_3_11(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_11), .w_tx_out(w_tx_out_3), .post_H(post_H_3_11));
//    computeH ch_3_12(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_12), .w_tx_out(w_tx_out_3), .post_H(post_H_3_12));
//    computeH ch_3_13(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_13), .w_tx_out(w_tx_out_3), .post_H(post_H_3_13));
//    computeH ch_3_14(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_14), .w_tx_out(w_tx_out_3), .post_H(post_H_3_14));
//    computeH ch_3_15(.clk(clk), .reset(reset), .mat_H_row(mat_H_row_3_15), .w_tx_out(w_tx_out_3), .post_H(post_H_3_15));
    
//    reg [1:0] processing;
//    reg [4:0] counter;
    
//    always@(posedge clk) begin
//        if(reset) begin
//            processing <= 2'b00;
//            FMC_ready <= 1'b0;
//            counter <= 5'b00000;
//            FMC_valid_cable <= 1'b0;
//            FMC_data_cable <= 53'b0;            
//            FMC_isIM_cable <= 1'b0;
//        end
//        else begin
////            if(FMC_ready_cable && (processing==2'b00)) begin // ready to accept data
////                FMC_ready <= 1'b1;
////            end
////            else begin // if it's processing data or rx is not ready,
////                FMC_ready <= 1'b0;
////            end 
 
//            if(FMC_valid && FMC_ready_cable && (processing==2'b00)) begin
//                FMC_valid_cable <= 1'b0;
//                FMC_data_cable <= 53'b0;
//                FMC_isIM_cable <= 1'b0;
//                processing <= 2'b01;
//                FMC_ready <= 1'b0;
//            end
//            else if(processing == 2'b01) begin // fetch from mat_H_lookup
//                FMC_valid_cable <= 1'b0;
//                processing <= 2'b10;
//                FMC_ready <= 1'b0;
//            end
//            else if(processing == 2'b10) begin // compute H, and post_H_sum's should be ready by this time
//                FMC_valid_cable <= 1'b1;
//                if(counter==5'b00000) begin
//                    FMC_data_cable <= post_H_sum_0[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00001) begin
//                    FMC_data_cable <= post_H_sum_0[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00010) begin
//                    FMC_data_cable <= post_H_sum_1[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00011) begin
//                    FMC_data_cable <= post_H_sum_1[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00100) begin
//                    FMC_data_cable <= post_H_sum_2[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00101) begin
//                    FMC_data_cable <= post_H_sum_2[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00110) begin
//                    FMC_data_cable <= post_H_sum_3[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b00111) begin
//                    FMC_data_cable <= post_H_sum_3[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
                
//                else if(counter==5'b01000) begin
//                    FMC_data_cable <= post_H_sum_4[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01001) begin
//                    FMC_data_cable <= post_H_sum_4[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01010) begin
//                    FMC_data_cable <= post_H_sum_5[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01011) begin
//                    FMC_data_cable <= post_H_sum_5[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01100) begin
//                    FMC_data_cable <= post_H_sum_6[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01101) begin
//                    FMC_data_cable <= post_H_sum_6[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01110) begin
//                    FMC_data_cable <= post_H_sum_7[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b01111) begin 
//                    FMC_data_cable <= post_H_sum_7[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;                    
////                    processing <= 2'b00; // data has been processed
//                end

//                else if(counter==5'b10000) begin
//                    FMC_data_cable <= post_H_sum_8[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10001) begin
//                    FMC_data_cable <= post_H_sum_8[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10010) begin
//                    FMC_data_cable <= post_H_sum_9[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10011) begin
//                    FMC_data_cable <= post_H_sum_9[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10100) begin
//                    FMC_data_cable <= post_H_sum_10[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10101) begin
//                    FMC_data_cable <= post_H_sum_10[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10110) begin
//                    FMC_data_cable <= post_H_sum_11[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b10111) begin
//                    FMC_data_cable <= post_H_sum_11[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
                
//                else if(counter==5'b11000) begin
//                    FMC_data_cable <= post_H_sum_12[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11001) begin
//                    FMC_data_cable <= post_H_sum_12[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11010) begin
//                    FMC_data_cable <= post_H_sum_13[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11011) begin
//                    FMC_data_cable <= post_H_sum_13[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11100) begin
//                    FMC_data_cable <= post_H_sum_14[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11101) begin
//                    FMC_data_cable <= post_H_sum_14[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= counter + 5'b00001;
//                end
//                else if(counter==5'b11110) begin
//                    FMC_data_cable <= post_H_sum_15[105:53];
//                    FMC_isIM_cable <= 1'b1; // this is imag data
//                    counter <= counter + 5'b00001;
//                end
//                else begin // if(counter==5'b11111)  
//                    FMC_data_cable <= post_H_sum_15[52:0];
//                    FMC_isIM_cable <= 1'b0; // this is real data
//                    counter <= 5'b00000;                    
//                    processing <= 2'b00; // data has been processed
//                end
//            end
//            else begin // processing == 2'b00
//                FMC_valid_cable <= 1'b0;
//                FMC_data_cable <= 53'b0;
//                FMC_isIM_cable <= 1'b0;
//                FMC_ready <= 1'b1;
//            end
//        end
//    end
//endmodule