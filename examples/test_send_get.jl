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
println("Received observation")
observation.base.orientation
# p = unsafe_wrap(Array, observation.imu.quaternion, 3; own=true)
# printstyled("pose $(observation.base.translation[1]) $(observation.base.translation[2]) $(observation.base.translation[3])", color=:magenta)
