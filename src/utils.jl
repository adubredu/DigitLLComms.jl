function wrap_to_pi!(angle::Float64)
    if angle > 0.0
        num_rotations = Int(ceil((angle + π)/2π))
        angle = angle - 2π*num_rotations
    else
        num_rotations = Int(ceil((angle - π)/2π))
        angle = angle - 2π*num_rotations
    end 
end

function convert_to_euler_rates(quat, ω)
    R = RotMatrix(QuatRotation(quat...))
    t2 = R[1]^2
    t3 = R[2]^2
    t4 = R[6]^2
    t5 = R[9]^2
    t6 = t2 + t3
    t7 = 1.0 / t6
    yaw_dot = -R[2] * t7 * (R[4] * ω[3] - R[7] * ω[2]) + R[1] * t7 * (R[5] * ω[3] - R[8] * ω[2])
    pitch_dot = -1.0 / sqrt(-R[3]^2 + 1.0) * (R[6] * ω[3] - R[9] * ω[2])
    roll_dot = (t4 * ω[1] + t5 * ω[1] - R[3] * R[6] * ω[2] - R[3] * R[9] * ω[3]) / (t4 + t5)

    return [yaw_dot, pitch_dot, roll_dot]
end

function quat_to_rpy(q::Vector{Float64})
    quat = QuatRotation(q)
    zyx = RotZYX(quat)
    ypr = [zyx.theta1, zyx.theta2, zyx.theta3]
    return ypr
end 

function rpy_to_quat(q::Vector{Float64})
    ypr = RotZYX(q...)
    qr = QuatRotation(ypr)
    quat = [qr.q.s, qr.q.v3, qr.q.v2, qr.q.v1]
    return quat
end
