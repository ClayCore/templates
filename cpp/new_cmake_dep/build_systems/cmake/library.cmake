# Get the project name from the filename
get_filename_component(project_name ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE " " "_" project_name ${project_name})
project(${project_name})

message(STATUS "Starting build of binary: '${project_name}'")

# Add all the necessary include directories
include_directories(
    ${SFML_HEADERS}
    ${SDL2_HEADERS}
    ${OPENGL_HEADERS}
    ${GLAD_HEADERS}
    ${GLFW3_HEADERS}
    ${GLM_HEADERS}
    ${LIBRARIES_PATH}
)

# Get all headers and sources
file(
    GLOB_RECURSE
    SOURCES
    *.cpp
    */*.cpp
    *.cc
    */*.cc
)
file(
    GLOB_RECURSE
    HEADERS
    *.hpp
    */*.hpp
    *.hh
    */*.hh
)

message(STATUS "Library source files: '${SOURCES}'")
message(STATUS "Library header files: '${HEADERS}'")

# Add the executable
add_library(${project_name} ${SOURCES} ${HEADERS})

# Acquire the compile options and link them against our libraries
target_compile_options(${project_name} PUBLIC ${GLOBAL_COMPILE_OPTIONS})
target_compile_features(${project_name} PUBLIC cxx_std_20)

# If we're running a win32 compilation, we need the gdi32 library
if(NOT WIN32)
    target_link_libraries(
        ${project_name}
        ${ALL_LIBRARIES}
        ${GLFW3_LIBRARIES}
        ${GLAD_LIBRARIES}
        ${SDL2_LIBRARIES}
        ${SFML_LIBRARIES}
        ${OPENGL_LIBRARIES}
    )
else()
    target_link_libraries(
        ${project_name}
        ${ALL_LIBRARIES}
        ${GDI32_LIBRARIES}
        ${GLFW3_LIBRARIES}
        ${GLAD_LIBRARIES}
        ${SDL2_LIBRARIES}
        ${SFML_LIBRARIES}
        ${OPENGL_LIBRARIES}
    )
endif(NOT WIN32)
