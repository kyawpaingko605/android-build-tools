# SPDX-License-Identifier: Apache-2.0
# sysprop.cmake: cmake file for sysprop directory

set(sysprop_SRCS
    sysprop/CodeWriter.cpp
    sysprop/Common.cpp
)

protobuf_generate_cpp(SYSPROP_PROTO_SRCS SYSPROP_PROTO_HDRS
    sysprop/sysprop.proto
)

add_library(sysprop STATIC
    ${sysprop_SRCS}
    ${SYSPROP_PROTO_SRCS}
)

target_include_directories(sysprop PUBLIC
    sysprop/include
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(sysprop PUBLIC
    libbase
    liblog
    protobuf::libprotobuf
)

add_executable(sysprop_cpp
    sysprop/CppGen.cpp
    sysprop/CppMain.cpp
)

target_link_libraries(sysprop_cpp PRIVATE
    sysprop
)

add_executable(sysprop_java
    sysprop/JavaGen.cpp
    sysprop/JavaMain.cpp
)

target_link_libraries(sysprop_java PRIVATE
    sysprop
)
