# passed
using Revise
using DigitLLComms 

publisher_address = "127.0.0.1"
llapi_init(publisher_address)
 
command = llapi_command_t() 
command.apply_command = false
llapi_send_command(Ref(command)) 
