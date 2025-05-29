cmake_minimum_required(VERSION 3.5)

project(ffmpeg-decoder)

# Compiler flags
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_EXE_LINKER_FLAGS "-static")
set(CMAKE_EXECUTABLE_ENABLE_EXPORTS, TRUE)

# Build debug version
if(CMAKE_BUILD_TYPE STREQUAL Debug)
    message(STATUS "Debug mode")
    add_definitions(-DDEBUG)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -O0 -g -rdynamic -Wl,--no-as-needed")
else()
    message(STATUS "Release mode")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -O2 -Wl,--no-as-needed")
endif()


# Include directories
set(VIDC_TEST_INCLUDES
    inc/
    third_party/ffmpeg_output/include
)
include_directories(${VIDC_TEST_INCLUDES})
link_directories(
    third_party/ffmpeg_output/lib
)

set(VIDC_TEST_SOURCES
    main.cpp
    src/io_data.cpp
    src/video_decoder_core.cpp
    src/FFStreamParser.cpp
)

add_executable(ffmpeg-decoder ${VIDC_TEST_SOURCES})
target_link_libraries(ffmpeg-decoder avformat avcodec swresample avutil pthread)
