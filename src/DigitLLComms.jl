module DigitLLComms

include("constants.jl")
include("types.jl")
include("initialize.jl")
include("get.jl")
include("set.jl")

# functions
export llapi_init,
       lapi_init_custom,
       llapi_get_observation, 
       llapi_get_error_shutdown_delay, 
       llapi_connected

# types 
export llapi_observation_t,
       llapi_command_t,
       llapi_limits_t,
       motor_obs_t,
       llapi_motor_t

# getters 
export  llapi_get_observation,
        get_motor_positions,
        get_motor_velocities,
        get_motor_torques,
        get_base_translation,
        get_base_orientation,
        get_base_linear_velocity,
        get_base_angular_velocity,
        get_imu_magnetic_field,
        get_imu_linear_acceleration,
        get_imu_angular_velocity,
        get_joint_positions,
        get_joint_velocities,
        get_torque_limits,
        get_damping_limits,
        get_velocity_limits

# setters
export send_command,
       llapi_send_command

# constants 
export  LeftHipRoll,
        LeftHipYaw,
        LeftHipPitch,
        LeftKnee,
        LeftToeA,
        LeftToeB,

        RightHipRoll,
        RightHipYaw,
        RightHipPitch,
        RightKnee,
        RightToeA,
        RightToeB,

        LeftShoulderRoll,
        LeftShoulderPitch,
        LeftShoulderYaw,
        LeftElbow,

        RightShoulderRoll,
        RightShoulderPitch,
        RightShoulderYaw,
        RightElbow,

        LeftShin,
        LeftTarsus,
        LeftToePitch,
        LeftToeRoll,
        LeftHeelSpring,

        RightShin,
        RightTarsus, 
        RightToePitch,
        RightToeRoll,
        RightHeelSpring,

        Disabled,
        Damping,
        Locomotion,

        NUM_MOTORS,
        NUM_JOINTS

end # module
