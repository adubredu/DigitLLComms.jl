function llapi_send_command(cmd::Ref{llapi_command_t})
    @ccall ll.llapi_send_command(cmd::Ref{llapi_command_t})::Cvoid 
end

function send_command(torques::Vector{Float64}, velocities::Vector{Float64},
        dampings::Vector{Float64}, fallback_opmode::Any, apply_command::Bool)
        @ccall ll.send_command(torques::Ptr{Cdouble}, velocities::Ptr{Cdouble}, dampings::Ptr{Cdouble}, fallback_opmode::Cint, apply_command::Bool)::Cvoid
end

