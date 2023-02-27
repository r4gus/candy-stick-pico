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

add_subdirectory(deps)

# rest of your project
add_executable(candystick
    # tinyusb
    src/c/usb_descriptors.c
    # little fs
    src/c/rpi_pico_lfs.c
)

target_include_directories(candystick PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/include
    # little fs
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src
)

target_link_libraries(candystick PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/zig-out/lib/libcandystick-app.a 
    pico_stdlib
    pico_time
    hardware_flash
    tinyusb_device 
    tinyusb_board
    tinyusb_additions
    littlefs
)

# create map/bin/hex/uf2 file in addition to ELF
pico_add_extra_outputs(candystick)
