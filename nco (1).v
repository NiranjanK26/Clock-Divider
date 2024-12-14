module nco(clk,sigSel,rst,op);
    input clk,rst;
    input [1:0] sigSel;
    output op;
    wire [3:0] qwire;
    tff t0(clk,1'b1,qwire[0],rst);
    tff t1(qwire[0],1'b1,qwire[1],rst);
    tff t2(qwire[1],1'b1,qwire[2],rst);
    tff t3(qwire[2],1'b1,qwire[3],rst);
    mux4x1 m0(qwire,sigSel,op);
endmodule


module tff(clk,t,q,rst);
    input clk,t,rst;
    output reg q;
    always @ (negedge clk) begin   // synchronous reset
        if (~rst) q = 1'b0;
        else if (t) q = ~q;
        else q = q;
    end
endmodule

module mux4x1(ip,sel,out);
    input [3:0] ip;
    input [1:0] sel;
    output out;
    assign out = ip[sel];
endmodule