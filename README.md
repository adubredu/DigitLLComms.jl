# DigitLLComms.jl

Julia package for sending low-level commands and receiving low-level observations for Agility Robotics's Digit Robot.

## Installation
1. Open your Julia REPL by typing  `julia` in your terminal.
2. Press `]` on your keyboard to enter the package manager
3. Enter command `add https://github.com/adubredu/DigitLLComms.jl"` and press 
`Enter` on your keyboard to install this package.
4. Press the `Backspace` key on your keyboard to return to the REPL


## Notice
- This package communicates with Digit's low-level control system via two main ways. 
- The first approach, which is the most stable and reliable, is over ROS services. An example of how to use this approach is [here](examples/test_ros_observation.jl)
- The second approach uses Julia's nifty [ccall](https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/) functionality to call functions in an extension of Agility Robotics's original low-level API C code. This approach, although works reliably, causes a segmentation fault whenever you quit the program. This is an open bug which I'm still figuring out how to fix. Any help with this will be appreciated.

Both approaches are low-latency and have been used to run 400Hz controllers on the physical digit robot.

## Usage
### First approach
 Open a linux terminal and run the following commands to start up the ROS service communication with Agility Robotics's low-level API in simulation.

```bash
cd DigitLLComms.jl/src/sim
./run_sim.sh
```
If running on the physical digit, replace `./run_sim.sh` with `./digit_real.sh`.

After doing this, you can check [this example](examples/test_ros_observation.jl) on example usage.

### Second approach
Check the examples in [examples](examples) except those labelled with "ros" for example usage. 

This [example](examples/standing_controller.jl) implements a joint configuration reference standing controller with the second approach.