struct llapi_quaternion_t
    w::Cdouble
    x::Cdouble
    y::Cdouble 
    z::Cdouble 
    llapi_quaternion_t() = new(0.0, 0.0, 0.0, 0.0)
end

struct motor_obs_t 
    position::Ptr{Cdouble}
    velocity::Ptr{Cdouble}
    torque::Ptr{Cdouble}
    motor_obs_t() = new(pointer(zeros(20)), pointer(zeros(20)), pointer(zeros(20)))
end

struct BaseLink 
    translation::Ptr{Cdouble}
    orientation::llapi_quaternion_t
    linear_velocity::Ptr{Cdouble}
    angular_velocity::Ptr{Cdouble}
    BaseLink() = new(pointer(zeros(3)), llapi_quaternion_t(), pointer(zeros(3)), pointer(zeros(3)))
end 

struct Imu 
    orientation::llapi_quaternion_t
    angular_velocity::Ptr{Cdouble}
    linear_acceleration::Ptr{Cdouble}
    magnetic_field::Ptr{Cdouble}
    Imu() = new(llapi_quaternion_t(), pointer(zeros(3)), pointer(zeros(3)), pointer(zeros(3)))
end

struct Motor 
    position::Ptr{Cdouble}
    velocity::Ptr{Cdouble}
    torque::Ptr{Cdouble}
    Motor() = new(pointer(zeros(NUM_MOTORS)), pointer(zeros(NUM_MOTORS)), pointer(zeros(NUM_MOTORS)))
end

struct Joint 
    position::Ptr{Cdouble}
    velocity::Ptr{Cdouble}
    Joint() = new(pointer(zeros(NUM_JOINTS)), pointer(zeros(NUM_JOINTS)))
end

mutable struct llapi_observation_t 
    time::Cdouble 
    error::Bool 
    base::BaseLink 
    imu::Imu 
    motor::Motor 
    joint::Joint 
    battery_charge::Cint
    llapi_observation_t() = new(0.0, false, BaseLink(), Imu(), Motor(), Joint(), 0)
end

mutable struct llapi_limits_t 
    torque_limit::Ptr{Cdouble}
    damping_limit::Ptr{Cdouble}
    velocity_limit::Ptr{Cdouble}
    llapi_limits_t() = new(pointer(zeros(NUM_MOTORS)), pointer(zeros(NUM_MOTORS)), pointer(zeros(NUM_MOTORS)))
end

mutable struct llapi_motor_t
    torque::Cdouble 
    velocity::Cdouble 
    damping::Cdouble 
    llapi_motor_t() = new(0.0, 0.0, 0.0)
end

mutable struct llapi_command_t 
    motors::Vector{llapi_motor_t} 
    fallback_opmode::Cint 
    apply_command::Bool 
    llapi_command_t() = new([], 1, false)
end

Base.@kwdef struct DIGIT_Q_COORD 
    qbase_pos_x::Int64 = 1 
    qbase_pos_y::Int64 = 2
    qbase_pos_z::Int64 = 3
    qbase_yaw::Int64 = 4
    qbase_pitch::Int64 = 5
    qbase_roll::Int64 = 6
    qleftHipRoll::Int64 = 7
    qleftHipYaw::Int64 = 8
    qleftHipPitch::Int64 = 9
    qleftKnee::Int64 = 10
    qleftKneeToShin::Int64 = 11
    qleftShinToTarsus::Int64 = 12
    qleftToePitch::Int64 = 13
    qleftToeRoll::Int64 = 14
    qleftShoulderRoll::Int64 = 15
    qleftShoulderPitch::Int64 = 16
    qleftShoulderYaw::Int64 = 17
    qleftElbow::Int64 = 18
    qrightHipRoll::Int64 = 19
    qrightHipYaw::Int64 = 20
    qrightHipPitch::Int64 = 21
    qrightKnee::Int64 = 22
    qrightKneeToShin::Int64 = 23
    qrightShinToTarsus::Int64 = 24
    qrightToePitch::Int64 = 25
    qrightToeRoll::Int64 = 26
    qrightShoulderRoll::Int64 = 27
    qrightShoulderPitch::Int64 = 28
    qrightShoulderYaw::Int64 = 29
    qrightElbow::Int64 = 30
end

qindex = DIGIT_Q_COORD()