using Revise 
using DigitLLComms

Kp = 1050.0
Kd = 0.5 
# reference standing motor positions
θrefs = [0.32869133647921467, -0.02792180592249217, 0.3187324455828634, 0.36118057019763633, -0.14684031092035302, 0.11311574329868718, -0.32875125760374146, 0.02783743697915846, -0.31868450868324194, -0.3611086648482042, 0.14674060216914045, -0.11315409281838432, -0.15050988058637318, 1.0921200187801636, 0.00017832526659170586, -0.13909131109654943, 0.15051467427633533, -1.0921631619898227, -0.00017832526659170586, 0.13910089847647372]

publisher_address = "127.0.0.1"
llapi_init(publisher_address)

command = llapi_command_t()
observation = llapi_observation_t()

command.apply_command = false
while (!(llapi_get_observation(Ref(observation))==1)) 
    llapi_send_command(Ref(command)) 
end
damping_limits = get_damping_limits()
for c=1:10000
    translation = get_base_translation(Ref(observation))
    # printstyled("pose $(translation[1]) $(translation[2]) $(translation[3])\n", color=:magenta)
    # llapi_send_command(Ref(command))
    torques = Float64[]
    velocities = Float64[]
    dampings = Float64[]
    for i=1:NUM_MOTORS
        motor_positions = get_motor_positions(Ref(observation))  
        push!(torques, Kp * (θrefs[i] - motor_positions[i]))
        push!(velocities, 0.0)
        push!(dampings, Kd * damping_limits[i]) 
        printstyled("cmd $(motor_positions[i]) $(torques[i]) $(velocities[i]) $(dampings[i])\n", color=:magenta)
    end
    fallback_opmode = Damping 
    apply_command = true 
    send_command(torques, velocities, dampings, fallback_opmode, apply_command) 
    sleep(10E-10)
end
