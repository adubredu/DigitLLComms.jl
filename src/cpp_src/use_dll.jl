
# module DigitLowLevelAPI
# using CxxWrap
#     @wrapmodule(joinpath("/home/alphonsus/research/walking_packages/DigitLowLevel/digitll/build/lib", "libDigitLowLevel"))

#     function __init__()
#         @initcxx 
#     end
# end
 

dll = DigitLowLevelAPI.DigitLowLevel()
for i=1:30  
    t = DigitLowLevelAPI.get_observation_base(dll)
    trans = DigitLowLevelAPI.get_data(t[1])
    sleep(1)
    @show trans
end