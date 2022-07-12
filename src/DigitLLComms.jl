module DigitLLComms

wspath = joinpath(@__DIR__, "sim/ws")
wssource = joinpath(wspath, "devel/setup.bash")
llapipath = joinpath(wspath, "src/digit_llapi/libs/libartl")
run(`catkin_make -C $wspath`) 
run(`bash -c 'source '$wssource''`) 
run(`make -C $llapipath`)

using Rotations 
using LinearAlgebra
using RobotOS 
@rosimport digit_msgs.srv: Digit_Observation_srv, Digit_Commands_srv 
rostypegen(@__MODULE__)
using .digit_msgs.srv 

include("constants.jl")
include("types.jl")
include("initialize.jl")
include("get.jl")
include("set.jl")
include("utils.jl")


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

# ros interface
export initialize_ros_node,
       send_ros_motor_command,
       get_ros_observation,
       get_generalized_coordinates

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
