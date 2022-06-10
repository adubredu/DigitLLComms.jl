#  
using Revise
using DigitLLComms 

publisher_address = "127.0.0.1"
llapi_init(publisher_address)
 
command = llapi_command_t()  
observation = llapi_observation_t() 
command.apply_command = false
while !(llapi_get_observation(Ref(observation))==1) 
    llapi_send_command(Ref(command))
    printstyled("Querying...",color=:green) 
end 

@show  get_motor_positions(Ref(observation))
@show  get_motor_velocities(Ref(observation))
@show  get_motor_torques(Ref(observation))
@show  get_base_translation(Ref(observation))
@show  get_base_linear_velocity(Ref(observation))
@show  get_base_angular_velocity(Ref(observation))
@show  get_imu_magnetic_field(Ref(observation))
@show  get_imu_linear_acceleration(Ref(observation))
@show  get_imu_angular_velocity(Ref(observation))
@show  get_joint_positions(Ref(observation))
@show  get_joint_velocities(Ref(observation))
 
