# Get the project name from the filename
get_filename_component(project_name "${CMAKE_SOURCE_DIR}" NAME)
project(${project_name})

message(STATUS "project ${project_name} now building...")

# Include macro definitions
include(${CMAKE_MODULE_PATH}/macros.cmake)

# Set necessary output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/target/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/target/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/target/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/target/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/target/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/target/bin)

message(STATUS "library output path: '${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}'")
message(STATUS "binary output path: '${CMAKE_RUNTIME_OUTPUT_DIRECTORY}'")

# Add a debug definition in the case we're running a debug build.
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-D_DEBUG)
endif (CMAKE_BUILD_TYPE STREQUAL "Debug")

# Set compile options
set(
    GLOBAL_COMPILE_OPTIONS
    ${GLOBAL_COMPILE_OPTIONS}
    -std=c17
    -Wall
    -Wextra
    -Wpedantic
    -O2
)

message(STATUS "compile options: [${GLOBAL_COMPILE_OPTIONS}]")

# Get all packages

# Only add gdi if we're running on windows
if(CMAKE_C_COMPILER_ID MATCHES MSVC)
    find_package(GDI32 REQUIRED)
endif(CMAKE_C_COMPILER_ID MATCHES MSVC)

find_package(SDL2 REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLAD REQUIRED)
find_package(GLFW3 REQUIRED)
find_package(CGLM REQUIRED)
find_package(OpenMP REQUIRED)

# Adding all projects
ADD_PROJECTS(ALL_LIBRARIES ${LIBRARIES_PATH} ${PROJECT_SOURCE_DIR}/target/lib ${project_name})
ADD_PROJECTS(ALL_EXECUTABLES ${EXECUTABLES_PATH} ${PROJECT_SOURCE_DIR}/target/bin ${project_name})
