cmake_minimum_required(VERSION 3.10)

message(STATUS "starting configure...")

# Set all the required paths for cmake to work.
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake CACHE PATH "Project specific path. Set manually if it was not found.")
set(EXECUTABLES_PATH ${CMAKE_SOURCE_DIR}/src CACHE PATH "Project specific path. Set manually if it was not found.")
set(LIBRARIES_PATH ${CMAKE_SOURCE_DIR}/lib CACHE PATH "Project specific path. Set manually if it was not found.")
set(DEPENDENCIES_PATH ${CMAKE_SOURCE_DIR}/deps CACHE PATH "Project specific path. Set manually if it was not found.")

message(STATUS "module paths: '${CMAKE_MODULE_PATH}'")
message(STATUS "executables '${EXECUTABLES_PATH}'")
message(STATUS "libraries: '${LIBRARIES_PATH}'")
message(STATUS "dependencies: '${DEPENDENCIES_PATH}'")

# These are for resources.
# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake CACHE PATH "Project specific path. Set manually if it was not found.")
# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake CACHE PATH "Project specific path. Set manually if it was not found.")

include(${CMAKE_MODULE_PATH}/complete_project.cmake)