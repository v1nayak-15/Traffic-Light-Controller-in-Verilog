# Traffic-Light-Controller-in-Verilog
This project implements a digital traffic light controller using Verilog HDL and simulates it with counters and a testbench. The design is based on a finite state machine (FSM) that controls the traffic flow between North-South (NS) and East-West (EW) directions.

#Working Principle

The controller manages Red, Yellow, and Green lights for both directions.
Initially, NS is Green and EW is Red.
After a fixed time (32 seconds), if vehicles are detected on EW, NS switches to Yellow, then to Red, and EW turns Green.
EW remains Green for 16 seconds before switching back through Yellow to NS Green.
Yellow lights always last 4 seconds, ensuring a safe transition.

Vehicle sensors (NS_vehicle_detect, EW_vehicle_detect) are used to decide whether switching is necessary, preventing wasted green time when no vehicles are present.
