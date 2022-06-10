function get_motor_positions(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_motor_positions(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end

function get_motor_velocities(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_motor_velocities(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end

function get_motor_torques(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_motor_torques(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end

function get_base_translation(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_base_translation(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_base_linear_velocity(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_base_linear_velocity(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_base_angular_velocity(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_base_angular_velocity(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_imu_magnetic_field(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_imu_magnetic_field(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_imu_linear_acceleration(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_imu_linear_acceleration(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_imu_angular_velocity(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_imu_angular_velocity(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 3) 
end

function get_joint_positions(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_joint_positions(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_JOINTS) 
end

function get_joint_velocities(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_joint_velocities(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_JOINTS) 
end

function get_torque_limits()
    val = @ccall ll.get_torque_limits()::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end

function get_damping_limits()
    val = @ccall ll.get_damping_limits()::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end

function get_velocity_limits()
    val = @ccall ll.get_velocity_limits()::Ptr{Cdouble}
    return unsafe_wrap(Array, val, NUM_MOTORS) 
end