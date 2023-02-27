cmake_minimum_required(VERSION 3.13)

# initialize pico-sdk from GIT
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_FETCH_FROM_GIT on)

# pico_sdk_import.cmake is a single file copied from this SDK
# note: this must happen before project()
include(pico_sdk_import.cmake)

project(my_project)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project
add_executable(candystick
    src/c/usb_descriptors.c    
)

target_include_directories(candystick PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
)

target_link_libraries(candystick PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/zig-out/lib/libcandystick-app.a 
    pico_stdlib
    pico_time
    tinyusb_device 
    tinyusb_board
    tinyusb_additions
)

# create map/bin/hex/uf2 file in addition to ELF
pico_add_extra_outputs(candystick)
