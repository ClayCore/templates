# Get the project name from the filename
get_filename_component(project_name "${CMAKE_SOURCE_DIR}" NAME)
project(${project_name})

message(STATUS "Preparing project: '${project_name}'...")

# Include macro definitions
include(${CMAKE_MODULE_PATH}/macros.cmake)

# Set necessary output directories
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/target/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/target/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/target/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/target/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_SOURCE_DIR}/target/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_SOURCE_DIR}/target/bin)

message(STATUS "Library output path: '${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}'")
message(STATUS "Binary output path: '${CMAKE_RUNTIME_OUTPUT_DIRECTORY}'")

# Add a debug definition in the case we're running a debug build.
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-D_DEBUG)
endif(CMAKE_BUILD_TYPE STREQUAL "Debug")

# Set compile options
set(
    GLOBAL_COMPILE_OPTIONS
    ${GLOBAL_COMPILE_OPTIONS}
    -ftrapv
    -Wall
    -Wextra
    -march=native
    -Os
)
message(STATUS "Compile options: [${GLOBAL_COMPILE_OPTIONS}]")

# Get all packages

# Only add gdi if we're running on windows
if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
    find_package(GDI32 REQUIRED)
endif(CMAKE_CXX_COMPILER_ID MATCHES MSVC)

# Set default search paths for Linux
set(
    LINUX_SEARCH_PATHS 
    /Library/Frameworks
    /opt
    /opt/local
    /usr
    /usr/include
    /usr/include/GL
    /usr/include/x11
    /usr/local/include
    /usr/X11R6/include
)

# Get all the necessary packages
find_package(SFML REQUIRED audio network graphics window system)
find_package(SDL2 REQUIRED)
find_package(OpenMP REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLAD REQUIRED)
find_package(GLFW3 REQUIRED)
find_package(GLM REQUIRED)

# Adding all projects
ADD_PROJECTS(ALL_LIBRARIES ${LIBRARIES_PATH} ${CMAKE_SOURCE_DIR}/target/config/lib "${project_name}_makefiles")
ADD_PROJECTS(ALL_BINARIES ${BINARIES_PATH} ${CMAKE_SOURCE_DIR}/target/config/bin "${project_name}_makefiles")
