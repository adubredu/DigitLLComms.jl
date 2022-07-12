using Revise 
using DigitLLComms
const dl = DigitLLComms

initialize_ros_node()
T = 1000
loop_rate = dl.Rate(400.0)
for t=1:T 
    obs = get_ros_observation()
    println("toe positions: $(obs.motor_position[LeftToeA]) $(obs.motor_position[LeftToeB]) $(obs.motor_position[RightToeA]) $(obs.motor_position[RightToeA])")
end
