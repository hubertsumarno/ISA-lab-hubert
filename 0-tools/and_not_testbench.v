module and_not_testbench();
    logic a;
    logic b;
    logic c;
    logic d;

    initial begin
        /* INSERT WAVEFORM COMMANDS */
        $dumpfile("and_not_testbench_waves.vcd");
        $dumpvars(0,and_not_testbench);
        a=0;
        b=0;
        #1; // Delay one timeunit
        /* INSERT $display HERE */
        if ( d != ~(a&b) ) begin
            $display("Error : a=%d, b=%d, d=%d,  expected=%d", a, b, d, ~(a&b));
        end
        /* INSERT assert HERE */
        assert(d==1);
        assert(c==0);
        assert(a==0);
        assert(b==0);

        a=0;
        b=1;
        #1; // Delay one timeunit
        if ( d != ~(a&b) ) begin
            $display("Error : a=%d, b=%d, d=%d,  expected=%d", a, b, d, ~(a&b));
        end
        assert(d==1);
        assert(c==0);
        assert(a==0);
        assert(b==1);


        a=1;
        b=0;
        #1; // Delay one timeunit
        if ( d != ~(a&b) ) begin
            $display("Error : a=%d, b=%d, d=%d,  expected=%d", a, b, d, ~(a&b));
        end
        assert(d==1);
        assert(c==0);
        assert(a==1);
        assert(b==0);


        a=1;
        b=1;
        #1; // Delay one timeunit
        if ( d != ~(a&b) ) begin
            $display("Error : a=%d, b=%d, d=%d,  expected=%d", a, b, d, ~(a&b));
        end
        assert(d==0);
        assert(c==1);
        assert(a==1);
        assert(b==1);
    end

    and_gate n1(.a(a), .b(b), .r(c));
    not_gate n2(.a(c), .r(d));
endmodule
