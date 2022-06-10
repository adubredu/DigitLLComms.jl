const ll = "build/libhaha"

struct command_t 
    x::Float64
    y::Float64
    z::Float64
end

mutable struct observation_t 
    w::Cdouble 
    x::Cdouble 
    y::Cdouble 
    z::Cdouble 
    base::Ptr{Cdouble}
    observation_t() = new(0.0,0.0,0.0,0.0,pointer([0.0,0.0,0.0]))
end

# unsafe_string(@ccall ll.greet()::Cstring)

# cmd = Ref(command_t(1.0, 2.0, 3.0))
# @ccall ll.send_command(cmd::Ref{command_t})::Cdouble 

obs = Ref(observation_t())
@ccall ll.get_observation(obs::Ref{observation_t})::Cint 

@show obs[]
base = unsafe_wrap(Array, obs[].base, 3; own=true)
