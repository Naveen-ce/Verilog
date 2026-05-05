//Verilog code to demonstrate both automatic and non-automatic tasks

module task_tb;

  task non_auto_task;
    input integer id;
    integer i; 
    begin
      for(i=0;i<3;i=i+1) begin
        #1 
        $display("Time=%0t | NON-AUTO Task ID=%0d | i=%0d", $time,id,i);
      end
    end
  endtask

  task automatic auto_task;
    input integer id;
    integer i; 
    begin
      for(i=0;i<3;i=i+1) begin
        #1 
        $display("Time=%0t | AUTO Task ID=%0d | i=%0d", $time,id,i);
      end
    end
  endtask

  initial begin
    $display("\n Calling NON-AUTOMATIC task");
    fork
      non_auto_task(1);
      non_auto_task(2);
    join
    #5
    $display("\n Calling AUTOMATIC task ");
    fork
      auto_task(1);
      auto_task(2);
    join
    #5 $finish;
  end
endmodule

OUTPUT:
 Calling NON-AUTOMATIC task 
Time=1 | NON-AUTO Task ID=1 | i=0
Time=1 | NON-AUTO Task ID=1 | i=1
Time=2 | NON-AUTO Task ID=1 | i=2
Time=2 | NON-AUTO Task ID=1 | i=3

 Calling AUTOMATIC task 
Time=8 | AUTO Task ID=2 | i=0
Time=8 | AUTO Task ID=1 | i=0
Time=9 | AUTO Task ID=2 | i=1
Time=9 | AUTO Task ID=1 | i=1
Time=10 | AUTO Task ID=2 | i=2
Time=10 | AUTO Task ID=1 | i=2
