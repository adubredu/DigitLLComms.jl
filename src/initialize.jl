function llapi_init(pub_addr::String)
    @ccall ll.llapi_init(pub_addr::Cstring)::Cvoid
end

function llapi_init_custom(pub_addr::String, listen_port::Int32, send_port::Int32)
    @ccall ll.llapi_init_custom(pub_addr::Cstring, listen_port::Cint, send_port::Cint)::Cvoid 
end

function llapi_get_observation(obs::Ref{llapi_observation_t})
    t = @ccall ll.llapi_get_observation(obs::Ref{llapi_observation_t})::Cint 
    return t 
end

function llapi_get_error_shutdown_delay()
    delay = @ccall ll.llapi_get_error_shutdown_delay()::Cdouble 
    return delay 
end

function llapi_connected()
    is_connected = @ccall ll.llapi_connected()::Bool 
    return is_connected 
end

function llapi_get_limits()
    limits = @ccall ll.llapi_get_limits()::Ref{llapi_limits_t}
    return limits 
end
  
function initialize_ros_node()
    init_node(ros_node_name)
end