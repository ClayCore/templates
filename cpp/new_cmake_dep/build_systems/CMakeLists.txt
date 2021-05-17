cmake_minimum_required(VERSION 3.14)

set(project_name powder_toy++)
project(${project_name})

message(STATUS "Starting configure for '${project_name}'...")

# Set all the required paths for cmake to work.
# Additional cmake modules (Find*.cmake, binary and library submodules, macros)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake CACHE PATH "Not found")
message(STATUS "Module paths: '${CMAKE_MODULE_PATH}'")

# Where binaries are located
set(BINARIES_PATH ${CMAKE_SOURCE_DIR}/src CACHE PATH "Not found")
message(STATUS "Binaries '${BINARIES_PATH}'")

# Where external or internal libraries are located
set(LIBRARIES_PATH ${CMAKE_SOURCE_DIR}/lib CACHE PATH "Not found")
message(STATUS "Libraries: '${LIBRARIES_PATH}'")

# Vendor/third-party libraries
set(DEPENDENCIES_PATH ${CMAKE_SOURCE_DIR}/vendor CACHE PATH "Not found")
message(STATUS "Dependencies: '${DEPENDENCIES_PATH}'")

# These are for resources.
# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake CACHE PATH)
# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake CACHE PATH)

include(${CMAKE_MODULE_PATH}/complete_project.cmake)
