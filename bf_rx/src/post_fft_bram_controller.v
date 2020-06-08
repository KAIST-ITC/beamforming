`timescale 1ns / 1ps

module post_fft_bram_controller(input clk, input resetn, input [31:0] fft_m_axis_data_tdata_0, input fft_m_axis_data_tvalid_0, output reg fft_m_axis_data_tready_0, 
    output reg [31:0] addra_0, output reg [3:0] wea_0, output reg [31:0] dina_0, output reg ena_0);

//    input [10:0] addrb_0, output [31:0] doutb_0, input enb_0, input web_0);
    
//    reg [10:0] addra_0;
//    wire [31:0] dina_0;
//    wire wea_0;
    
//    assign fft_m_axis_data_tready_0 = (addra_0<2048) ? 1'b1 : 1'b0;
//    assign dina_0 = fft_m_axis_data_tdata_0;
//    assign wea_0 = {1'b0,1'b0,1'b0,fft_m_axis_data_tvalid_0};
//    assign ena_0 = 1'b1;
     
//    always@(posedge clk) begin
//        if(!resetn) begin
//            addra_0 <= 0;
//        end
//        else begin
//            if(fft_m_axis_data_tvalid_0) begin
//                addra_0 <= addra_0 + 1; // does this have to increment by 1?
//            end
//            else begin
//                addra_0 <= addra_0;            
//            end
//        end
//    end
    
    always@(posedge clk) begin
        if(!resetn) begin
            addra_0 <= 32'b0;
            fft_m_axis_data_tready_0 <= 1'b0;
            wea_0 <= 4'b0000;
            dina_0 <= 32'b0;
            ena_0 <= 1'b0;
        end
        else begin

            if(fft_m_axis_data_tvalid_0) begin
                wea_0 <= 4'b1111;
            end
            else begin
                wea_0 <= 4'b0000;
            end
            
            if(addra_0<32'd8192) begin
                fft_m_axis_data_tready_0 <= 1'b1;
            end
            else begin
                fft_m_axis_data_tready_0 <= 1'b0;
            end

            dina_0 <= fft_m_axis_data_tdata_0;
            ena_0 <= 1'b1;

            if(fft_m_axis_data_tvalid_0) begin
                addra_0 <= addra_0 + 32'd4; // does this have to increment by 1?
            end
            else begin
                addra_0 <= addra_0;            
            end
        end
    end


endmodule
