module tb_async_fifo;
parameter depth=8;
parameter width=8;
reg wclk,wrst,rclk,rrst;
reg wrt_en,rd_en;
reg [width-1:0] data_in;
wire [width-1:0] data_out;
wire full,empty;

async_fifo #(.depth(depth), .width(width)) uut(.wclk(wclk), .rclk(rclk), .wrst(wrst), .rrst(rrst), .wrt_en(wrt_en), .rd_en(rd_en), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

always #5 wclk = ~wclk;   // Fast Write Clock (100MHz)
    always #12 rclk = ~rclk; // Slow Read Clock (~41.6MHz) - Different speeds reveal CDC issues!

    initial begin
        
        wclk   = 0; 
        rclk   = 0; 
        wrst   = 1; 
        rrst   = 1;
        wrt_en = 0; 
        rd_en  = 0; 
        data_in = 0;
        
        
        #30; 
        @(posedge wclk); wrst = 0; 
        @(posedge rclk); rrst = 0; 
        #20;

        //Write Phase (Fill up the FIFO)
        
        $display("");
        $display("|=========================================|");
        $display("|                WRITE PHASE              |");
        $display("|=========================================|");
        $display("");
        
        write_data(8'b10101000);
        write_data(8'b10101001);
        write_data(8'b10101010);
        write_data(8'b10101011);
        write_data(8'b10101100);
        write_data(8'b10101101);
        write_data(8'b10101110);
        write_data(8'b10101111);
        
        // To check 'full' 
        write_data(8'b11111111); 

       
        #50; 

        // Read Phase (Empty the FIFO)
        
        $display("");
        $display("|=========================================|");
        $display("|                READ PHASE               |");
        $display("|=========================================|");
        $display("");
        
        repeat (8) begin
            read_data();
        end
        
        // To check'empty' 
        read_data();

        #100;
        $finish;
    end

    // ==========================================
    // Verification Tasks 
    // ==========================================
    
    task write_data(input [width-1:0] data_to_send);
        begin
            @(posedge wclk); 
            if (!full) begin
                wrt_en  = 1;
                data_in = data_to_send;
            end
            else begin
                $display("Time=%0t | [WRITE SKIPPED] FIFO is FULL!", $time);
                wrt_en  = 0;
            end
            @(posedge wclk);
            wrt_en = 0; 
        end
    endtask

    task read_data();
        begin
            @(posedge rclk); 
            if (!empty) begin
                rd_en = 1;
            end
            else begin
                $display("Time=%0t | [READ SKIPPED] FIFO is EMPTY!", $time);
                rd_en = 0;
            end
            @(posedge rclk);
            rd_en = 0;
        end
    endtask

   
   
    initial begin
        $monitor("Time=%0t | wclk=%b | rclk=%b | full=%b | empty=%b | wrt_en=%b | data_in=%b | rd_en=%b | data_out=%b",$time, wclk, rclk, full, empty, wrt_en, data_in, rd_en, data_out);
        $dumpfile("async_fifo.vcd");
        $dumpvars(0, tb_async_fifo);
    end

endmodule
