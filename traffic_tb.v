`timescale 1ns / 1ps

module traffic_tb;

//Internal Wires/regs
wire [4:0] i_NS_count   ;
wire [3:0] i_EW_count   ;
wire [1:0] yellow_count ;
reg     CLK             ;

// INPUTS
reg         NS_vehicle_detect;
reg         EW_vehicle_detect;

// OUTPUTS
wire       NS_red		;
wire       NS_yellow    ;
wire       NS_green	    ;
wire       EW_red		;
wire       EW_yellow    ;
wire       EW_green	    ;



// Initial Block
initial begin

    CLK                 =1'b0       ;
    NS_vehicle_detect   =1'b1      ;
    EW_vehicle_detect   =1'b0       ;
    
    $display("      NS     |      EW     ");
    $display(" R    Y    G    R    Y    G");
    $monitor("%h   %h   %h   %h    %h  %h", NS_red, NS_yellow, NS_green, EW_red, EW_yellow, EW_green);
    
    #1000 $finish;
    
end

// CLOCK GENERATION
always
    #5 CLK      = ~CLK      ;

// Test Case 2
always@(CLK) begin
    if($time % 21 ==0) begin
    
        NS_vehicle_detect = ~NS_vehicle_detect;
        EW_vehicle_detect = ~EW_vehicle_detect;
    
    end
end
//End of test case 2

//Test  Case 3
always@(CLK) begin
    if($time % 2 ==0) begin
        NS_vehicle_detect = ~NS_vehicle_detect;
    
    if($time % 15 ==0) begin    
        EW_vehicle_detect = ~EW_vehicle_detect;
    
end
//end of test case 3
//Instantiations

//TRAFFIC CORE
traffic_light_ctrl_eng CORE (
// inputs
.i_NS_count  	 	(i_NS_count),
.i_EW_count  	 	(i_EW_count),
.yellow_count	 	(yellow_count),
.NS_vehicle_detect	(NS_vehicle_detect),
.EW_vehicle_detect  (EW_vehicle_detect),
//outputs
.NS_red			(NS_red),
.NS_yellow		(NS_yellow),
.NS_green		(NS_green),
.EW_red			(EW_red),
.EW_yellow		(EW_yellow),
.EW_green		(EW_green)
);

// NORTH SOUTH COUNTER
NS_count i_NS_count_0_(
.i_clk          (CLK),
.o_count        (i_NS_count)
);

// EAST WEST COUNTER
EW_count i_EW_count_0_(
.i_clk          (CLK),
.o_count        (i_EW_count)
);

//YELLOW LIGHT COUNTER
yellow_count i_yellow_Count_0_(
.i_clk          (CLK),
.o_count        (yellow_count)
);

endmodule

