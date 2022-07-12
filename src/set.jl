function llapi_send_command(cmd::Ref{llapi_command_t})
    @ccall ll.llapi_send_command(cmd::Ref{llapi_command_t})::Cvoid 
end

function send_command(torques::Vector{Float64}, velocities::Vector{Float64},
        dampings::Vector{Float64}, fallback_opmode::Any, apply_command::Bool)
        @ccall ll.send_command(torques::Ptr{Cdouble}, velocities::Ptr{Cdouble}, dampings::Ptr{Cdouble}, fallback_opmode::Cint, apply_command::Bool)::Cvoid
end

function send_ros_motor_command(fallback_opmode::Int64, apply_command::Bool,
    motor_torque::Vector{Float64}, motor_velocity::Vector{Float64},
    motor_damping::Vector{Float64})

    channel = ServiceProxy(command_service_name, Digit_Commands_srv)
    req = Digit_Commands_srvRequest()
    req.cmd.fallback_opmode = fallback_opmode
    req.cmd.apply_command = apply_command
    req.cmd.motor_torque = motor_torque
    req.cmd.motor_velocity = motor_velocity
    req.cmd.motor_damping = motor_damping
    response = channel(req) 
end
