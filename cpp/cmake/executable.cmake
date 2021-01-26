# Get the project name from the filename
get_filename_component(project_name ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE " " "_" project_name ${project_name})
project(${project_name})

message(STATUS "starting executable build of project: '${project_name}'")

include_directories(
    ${SDL2_HEADERS}
    ${OPENGL_HEADERS}
    ${GLAD_HEADERS}
    ${GLFW3_HEADERS}
    ${CGLM_HEADERS}
    ${EXTERNAL_LIBRARIES_PATHS}
    ${LIBRARIES_PATH}
)

# Get all headers and sources
file(GLOB_RECURSE SOURCES *.cpp)
file(GLOB_RECURSE HEADERS *.hpp)

message(STATUS "source files: `${SOURCES}`")
message(STATUS "header files: `${HEADERS}`")

# Add the executable
add_executable(${project_name} ${SOURCES} ${HEADERS})

# Acquire the compile options and link them against our libraries
target_compile_options(${project_name} PUBLIC ${GLOBAL_COMPILE_OPTIONS})

# If we're running a win32 compilation, we need the gdi32 library
if(NOT WIN32)
    target_link_libraries(
        ${project_name}
        INTERFACE ${ALL_LIBRARIES}
        PUBLIC ${GLFW3_LIBRARIES}
        PUBLIC ${CGLM_LIBRARIES}
        PUBLIC ${GLAD_LIBRARIES}
        PUBLIC ${SDL2_LIBRARIES}
        PUBLIC ${OPENGL_LIBRARIES}
    )
else()
    target_link_libraries(
        ${project_name}
        INTERFACE ${ALL_LIBRARIES}
        PRIVATE ${GDI32_LIBRARIES}
        PUBLIC ${GLFW3_LIBRARIES}
        PUBLIC ${CGLM_LIBRARIES}
        PUBLIC ${GLAD_LIBRARIES}
        PUBLIC ${SDL2_LIBRARIES}
        PUBLIC ${OPENGL_LIBRARIES}
    )
endif(NOT WIN32)