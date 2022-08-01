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

function get_base_orientation(obs::Ref{llapi_observation_t})
    val = @ccall ll.get_base_orientation(obs::Ref{llapi_observation_t})::Ptr{Cdouble}
    return unsafe_wrap(Array, val, 4) 
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

## ROS interface
function get_ros_observation()
    channel = ServiceProxy(observation_service_name, Digit_Observation_srv)
    send_request = Digit_Observation_srvRequest()
    response = channel(send_request)
    return response.obs 
end

function get_generalized_coordinates(observation)
    return (observation.q_all, observation.qdot_all)
end 

function get_generalized_coordinates2(observation) 
    q_pos = observation.base_translation
    qdot_pos = observation.base_linear_velocity 
    q_angvel = observation.base_angular_velocity 
    quat = [observation.base_orientation.w, 
            observation.base_orientation.x, 
            observation.base_orientation.y, 
            observation.base_orientation.z]  

    q_joints = observation.joint_position 
    q_motors = observation.motor_position 
    qdot_joints = observation.joint_velocity
    qdot_motors = observation.motor_velocity

    q_euler = quat_to_rpy(quat)
    qdot_euler = convert_to_euler_rates(quat, q_angvel) 

    Rz = RotZ(q_euler[1])
    qdot_pos = Rz * qdot_pos

    q_base = [q_pos..., q_euler...]
    qdot_base = [qdot_pos..., qdot_euler...]

    q_leg_left = [q_motors[LeftHipRoll],
                  q_motors[LeftHipYaw],
                  q_motors[LeftHipPitch],
                  q_motors[LeftKnee],
                  q_joints[LeftShin],
                  q_joints[LeftTarsus],
                  q_joints[LeftToePitch],
                  q_joints[LeftToeRoll]]
    qdot_leg_left = [qdot_motors[LeftHipRoll],
                  qdot_motors[LeftHipYaw],
                  qdot_motors[LeftHipPitch],
                  qdot_motors[LeftKnee],
                  qdot_joints[LeftShin],
                  qdot_joints[LeftTarsus],
                  qdot_joints[LeftToePitch],
                  qdot_joints[LeftToeRoll]]
    q_leg_right = [q_motors[RightHipRoll],
                  q_motors[RightHipYaw],
                  q_motors[RightHipPitch],
                  q_motors[RightKnee],
                  q_joints[RightShin],
                  q_joints[RightTarsus],
                  q_joints[RightToePitch],
                  q_joints[RightToeRoll]]
    qdot_leg_right = [qdot_motors[RightHipRoll],
                  qdot_motors[RightHipYaw],
                  qdot_motors[RightHipPitch],
                  qdot_motors[RightKnee],
                  qdot_joints[RightShin],
                  qdot_joints[RightTarsus],
                  qdot_joints[RightToePitch],
                  qdot_joints[RightToeRoll]]
    
    q_arm_left = [q_motors[LeftShoulderRoll],
                  q_motors[LeftShoulderPitch],
                  q_motors[LeftShoulderYaw],
                  q_motors[LeftElbow]]
    qdot_arm_left = [qdot_motors[LeftShoulderRoll],
                  qdot_motors[LeftShoulderPitch],
                  qdot_motors[LeftShoulderYaw],
                  qdot_motors[LeftElbow]]
    q_arm_right = [q_motors[RightShoulderRoll],
                   q_motors[RightShoulderPitch],
                   q_motors[RightShoulderYaw],
                   q_motors[RightElbow]]
    qdot_arm_right = [qdot_motors[RightShoulderRoll],
                      qdot_motors[RightShoulderPitch],
                      qdot_motors[RightShoulderYaw],
                      qdot_motors[RightElbow]]
    
    q_body = [q_leg_left..., q_arm_left..., q_leg_right..., q_arm_right...]
    qdot_body = [qdot_leg_left..., qdot_arm_left..., qdot_leg_right..., qdot_arm_right...]

    q_all = [q_base..., q_body...]
    qdot_all = [qdot_base..., qdot_body...]

    return (q_all, qdot_all)
end