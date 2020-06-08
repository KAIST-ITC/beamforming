`timescale 1ns / 1ps

// If start signal is asserted, reads data from four brams
module bram_controller(input clk, input resetn, input ctrl_start,
    // ifft config
    input ifft_s_axis_config_tready_0, // should be same for _1, _2, _3
    output reg ifft_s_axis_config_tvalid_0, // same for _1, _2, _3
    // ifft data
    input ifft_s_axis_data_tready_0, // should be same for _1, _2, _3
    output reg ifft_s_axis_data_tvalid_0, // same for _1, _2, _3
    output reg ifft_s_axis_data_tlast_0, // same for _1, _2, _3
    output reg [31:0] addr,
    output wire en);

    wire [31:0]dina_0; // don't write to this bram
    wire [31:0]dina_1; // don't write to this bram
    wire [31:0]dina_2; // don't write to this bram
    wire [31:0]dina_3; // don't write to this bram
    wire ena_0;

    assign en = ifft_s_axis_data_tready_0;

    always@(posedge clk) begin
        if(!resetn) begin
            addr <= 32'd0;
            ifft_s_axis_data_tvalid_0 <= 0;
            ifft_s_axis_config_tvalid_0 <= 0;
            ifft_s_axis_data_tlast_0 <= 0;

        end
        else begin
            if(ifft_s_axis_data_tready_0 && ctrl_start) begin // assumes that if ctrl_start is asserted, it stays asserted 
                // fft config
                if(ifft_s_axis_config_tready_0) begin
                    ifft_s_axis_config_tvalid_0 <= 1;
                end
                else begin
                    ifft_s_axis_config_tvalid_0 <= 0;
                end
                
                //addr update
                if(addr<4092) begin
                    addr <= addr+32'd4;
                    ifft_s_axis_data_tlast_0 <= 0;
                    // fft data
                    ifft_s_axis_data_tvalid_0 <= 1;
                end
                else if (addr==4092) begin
                    addr <= addr+32'd4;
                    ifft_s_axis_data_tlast_0 <= 1;
                    // fft data
                    ifft_s_axis_data_tvalid_0 <= 1;
                end
                else begin
                    addr<=addr; // stays at 1024
                    ifft_s_axis_data_tlast_0 <= 0;
                    // fft data
                    ifft_s_axis_data_tvalid_0 <= 0;
                end
            end
            
            else begin
                // ifft data
                addr <= addr;
                ifft_s_axis_data_tvalid_0 <= 0;
                ifft_s_axis_data_tlast_0 <= 0;
                // ifft config
                if(ifft_s_axis_config_tready_0) begin
                    ifft_s_axis_config_tvalid_0 <= 1;
                end
                else begin
                    ifft_s_axis_config_tvalid_0 <= 0;
                end                
            end
        end
    end


endmodule