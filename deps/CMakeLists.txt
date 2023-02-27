include(FetchContent)
FetchContent_Declare(
   littlefs 
   URL https://github.com/littlefs-project/littlefs/archive/master.zip
)
FetchContent_MakeAvailable(littlefs)

add_library(littlefs
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src/lfs.c
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src/lfs_util.c
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src/bd/lfs_filebd.c
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src/bd/lfs_rambd.c
)

target_include_directories(littlefs PRIVATE
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src
    ${CMAKE_BINARY_DIR}/_deps/littlefs-src/bd
)

