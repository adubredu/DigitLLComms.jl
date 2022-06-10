# passed
using Revise
using DigitLLComms 

publisher_address = "127.0.0.1"
llapi_init(publisher_address)
 
observation = llapi_observation_t()
val = llapi_get_observation(Ref(observation))
