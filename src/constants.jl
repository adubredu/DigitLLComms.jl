ll = joinpath(@__DIR__, "cpp_src/build/lib/liblowlevelapi")
LeftHipRoll = 1
LeftHipYaw = 2
LeftHipPitch = 3
LeftKnee = 4
LeftToeA = 5
LeftToeB = 6

RightHipRoll = 7
RightHipYaw = 8
RightHipPitch = 9
RightKnee = 10
RightToeA = 11
RightToeB = 12

LeftShoulderRoll = 13
LeftShoulderPitch = 14
LeftShoulderYaw = 15
LeftElbow = 16

RightShoulderRoll = 17
RightShoulderPitch = 18
RightShoulderYaw = 19
RightElbow = 20

LeftShin = 1
LeftTarsus = 2
LeftToePitch = 3
LeftToeRoll = 4
LeftHeelSpring = 5

RightShin = 6
RightTarsus = 7 
RightToePitch = 8
RightToeRoll = 9
RightHeelSpring = 10

Disabled = 1
Damping = 2
Locomotion = 3

NUM_MOTORS = 20
NUM_JOINTS = 10

qbase_pos_x = 1 
qbase_pos_y = 2
qbase_pos_z = 3
qbase_yaw = 4
qbase_pitch = 5
qbase_roll = 6
qleftHipRoll = 7
qleftHipYaw = 8
qleftHipPitch = 9
qleftKnee = 10
qleftKneeToShin = 11
qleftShinToTarsus = 12
qleftToePitch = 13
qleftToeRoll = 14
qleftShoulderRoll = 15
qleftShoulderPitch = 16
qleftShoulderYaw = 17
qleftElbow = 18
qrightHipRoll = 19
qrightHipYaw = 20
qrightHipPitch = 21
qrightKnee = 22
qrightKneeToShin = 23
qrightShinToTarsus = 24
qrightToePitch = 25
qrightToeRoll = 26
qrightShoulderRoll = 27
qrightShoulderPitch = 28
qrightShoulderYaw = 29
qrightElbow = 30

command_service_name = "/command_service"
observation_service_name = "/observation_service"
ros_node_name = "low_level_api"