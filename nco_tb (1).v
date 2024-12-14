module ncotb;
    reg clk,rst;
    reg [1:0] sigSel;
    wire op;
    nco DUT(.clk(clk),.sigSel(sigSel),.rst(rst),.op(op));

    initial begin
        $dumpfile("nco.vcd");
        $dumpvars(0,ncotb);
    end

    initial clk = 1'b0;
    always #100 clk = ~clk;

    initial begin
      	rst = 1'b0;
      	#150
      	rst = 1'b1;
        sigSel = 2'b11;
        #5000
        $finish;
    end
endmodule