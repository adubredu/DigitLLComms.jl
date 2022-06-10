cmake_minimum_required(VERSION 3.10.2)
project(LOWLEVELAPI)

# add_executable(${PROJECT_NAME} main.cpp DigitLowLevel.cpp lowlevelapi.c) 
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(JlCxx_DIR "/home/alphonsus/software/cxxwrap/libcxxwrap-julia-build")
set(Julia_EXECUTABLE "/home/alphonsus/software/julia/julia-1.6.3-linux-x86_64/julia-1.6.3/bin/julia")

find_package(JlCxx)
get_target_property(JlCxx_location JlCxx::cxxwrap_julia LOCATION)
get_filename_component(JlCxx_location ${JlCxx_location} DIRECTORY)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;${JlCxx_location}")

add_library(artl STATIC IMPORTED) 
add_library(lowlevelapi SHARED lowlevelapi.c)
set_property(TARGET artl PROPERTY IMPORTED_LOCATION "/home/alphonsus/research/walking_packages/DigitLowLevel/cmake_llapi/libartl.a")
target_link_libraries(lowlevelapi artl JlCxx::cxxwrap_julia)

install(TARGETS
    lowlevelapi
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION lib)