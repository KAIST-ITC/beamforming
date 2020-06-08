`timescale 1ns / 1ps

module fifo_rx_controller(input clk, input resetn, 
    input fifo_wr_en, output reg fifo_ready, // with w_rx
    input fft_ready, // with FFT
    output reg fifo_rd_en); // with FIFIO
    
//    input [31:0] fifo_in, input fifo_wr_en, output reg fifo_ready, 
//    input fft_ready, output fifo_valid, output [31:0] fifo_out);

    reg [10:0] counter;
    reg [10:0] counter_fifo_rd;
    reg processing_buf;
    
    always@(posedge clk) begin
        if(!resetn) begin
            counter <= 11'b0;
            counter_fifo_rd <= 11'b0;
//            fft_valid <= 1'b0;
            fifo_rd_en <= 1'b0;
            fifo_ready <= 1'b1;
            processing_buf <= 1'b0;
        end
        else begin
            if(counter<1024 && counter_fifo_rd==0 && fifo_wr_en) begin // creating pre-fft datastream, increment counter
                counter <= counter + 11'b1;
//                fft_valid <= 1'b0;
                counter_fifo_rd <= counter_fifo_rd;
                fifo_rd_en <= 1'b0;
                fifo_ready <= 1'b1;
                processing_buf <= 1'b0;
            end
            else if(counter==1024 && counter_fifo_rd<1024 && !processing_buf) begin // fifo is fully filled up, so read it
                counter <= counter;
//                fft_valid <= 1'b0;
                counter_fifo_rd <= counter_fifo_rd;
                fifo_rd_en <= 1'b1; // START READING FIFO
                fifo_ready <= 1'b0;
                processing_buf <= 1'b1; // DON'T NEED THIS ANYMORE
            end
            else if(counter==1024 && counter_fifo_rd<1024 && fft_ready) begin // processing fft, increment counter_fifo_rd
                counter <= counter;
//                fft_valid <= 1'b1; 
                counter_fifo_rd <= counter_fifo_rd + 11'b1;
                fifo_rd_en <= 1'b1;
                fifo_ready <= 1'b0;
                processing_buf <= 1'b1;
            end
            else if(counter==1024 && counter_fifo_rd<1024 && !fft_ready) begin // processing fft, increment counter_fifo_rd
                counter <= counter;
//                fft_valid <= 1'b1; 
                counter_fifo_rd <= counter_fifo_rd;
                fifo_rd_en <= 1'b0;
                fifo_ready <= 1'b0;
                processing_buf <= 1'b1;
            end            
            else if(counter==1024 && counter_fifo_rd==1024) begin // done
                counter <= 11'b0;
//                fft_valid <= 1'b0;
                counter_fifo_rd <= 11'b0;
                fifo_rd_en <= 1'b0;
                fifo_ready <= 1'b1;
                processing_buf <= 1'b0;
            end
            else begin // counter==0, counter_fifo_rd==0
                counter <= counter;
//                fft_valid <= 1'b0;
                counter_fifo_rd <= counter_fifo_rd;                
                fifo_rd_en <= 1'b0;
                fifo_ready <= 1'b1;
                processing_buf <= 1'b0;
            end
        end
    end

//    wire fifo_full, fifo_empty;
    
//    fifo_rx_wrapper pre_fifo_wrapper(.clk_0(clk),
//        .din_0(fifo_in),
//        .dout_0(fifo_out),
//        .empty_0(fifo_empty),
//        .full_0(fifo_full),
//        .rd_en_0(fifo_rd_en),
//        .srst_0(reset),
//        .valid_0(fifo_valid),
//        .wr_en_0(fifo_wr_en));

endmodule
