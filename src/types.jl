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

struct Base 
    translation::Ptr{Cdouble}
    orientation::llapi_quaternion_t
    linear_velocity::Ptr{Cdouble}
    angular_velocity::Ptr{Cdouble}
    Base() = new(pointer(zeros(3)), llapi_quaternion_t(), pointer(zeros(3)), pointer(zeros(3)))
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
    base::Base 
    imu::Imu 
    motor::Motor 
    joint::Joint 
    battery_charge::Cint
    llapi_observation_t() = new(0.0, false, Base(), Imu(), Motor(), Joint(), 0)
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


