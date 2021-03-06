cmake_minimum_required(VERSION 3.14)

# == Configuration ============================================================================ #

# Set project name.
get_filename_component(ProjectName ${CMAKE_CURRENT_LIST_DIR} NAME)
string(
    REPLACE " "
            "_"
            ProjectName
            ${ProjectName})
project(${ProjectName})

# Additional cmake module files
set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake
    CACHE PATH "Not Found.")

include(cmake/BaseProject.cmake)
include(cmake/PreventInSourceBuilds.cmake)

# Add pretty colors
if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    add_compile_options(-fcolor-diagnostics)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-fdiagnostics-color=always)
else()
    message(STATUS "No colored compiler diagnostics set for '${CMAKE_CXX_COMPILER_ID}' compiler")
endif()

# == Include various other cmake modules ========================================== #

# Enable cache system
include(cmake/Cache.cmake)

# Standard compiler warnings Add all the project options
add_library(project_options INTERFACE)
target_compile_features(project_options INTERFACE cxx_std_20)

# Link this 'library' to use various warnings specified in CompilerWarnings.cmake
add_library(project_warnings INTERFACE)

include(cmake/CompilerWarnings.cmake)
set_project_warnings(project_warnings)

# Sanitizer options if supported by the compiler
include(cmake/Sanitizers.cmake)
enable_sanitizers(project_options)

# DoxyGen
include(cmake/Doxygen.cmake)
enable_doxygen()

# Static analysis options
include(cmake/StaticAnalyzers.cmake)

# == Set all the necessary options ============================================================ #

option(BUILD_SHARED_LIBS "Enable compilation of shared libraries" OFF)
option(ENABLE_TESTING "Enable Test Builds" ON)
option(ENABLE_FUZZING "Enable Fuzzing Builds" OFF)

# Very basic PCH example
option(ENABLE_PCH "Enable Precompiled Headers" OFF)
if(ENABLE_PCH)
    # This sets a global PCH parameter, each project will build its own PCH, which is a good idea if any #define's
    # change
    #
    # consider breaking this out per project as necessary
    target_precompile_headers(
        project_options
        INTERFACE
        <vector>
        <string>
        <map>
        <utility>)
endif()

# Where to find libraries and source/header files
set(PROJECT_SOURCE_DIRS
    ${CMAKE_SOURCE_DIR}/src
    CACHE PATH "Not Found")
set(PROJECT_INCLUDE_DIRS
    ${CMAKE_SOURCE_DIR}/include
    CACHE PATH "Not Found")

# Dependencies
set(ProjectDependencies
    ${CMAKE_SOURCE_DIR}/vendor
    CACHE PATH "Not Found")

# NOTE: Turns out that SFML 2.5 recently remade its built system. This means many variables used everywhere else dont
# exist anymore and the entire CMake workflow relies on a single config file
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${ProjectDependencies}/sfml/lib/cmake/SFML)

# Set default search paths for Linux
set(LINUX_SEARCH_PATHS
    /Library/Frameworks
    /opt
    /opt/local
    /usr
    /usr/include
    /usr/include/GL
    /usr/include/x11
    /usr/local/include
    /usr/X11R6/include)

# == Package build and executable configuration =============================================== #

# Gather all dependencies
find_package(OpenMP)
find_package(OpenGL)
find_package(GLAD)
find_package(GLFW3)
find_package(GLM)
find_package(
    SFML 2.5
    COMPONENTS graphics
    REQUIRED)
find_package(SDL2)

# Gather all sources and headers
file(
    GLOB_RECURSE
    SOURCES
    ${PROJECT_SOURCE_DIRS}/*.cc
    ${PROJECT_SOURCE_DIRS}/*.cpp
    ${PROJECT_INCLUDE_DIRS}/*.cc
    ${PROJECT_INCLUDE_DIRS}/*.cpp
    ${PROJECT_SOURCE_DIRS}/*/*.cc
    ${PROJECT_SOURCE_DIRS}/*/*.cpp
    ${PROJECT_INCLUDE_DIRS}/*/*.cc
    ${PROJECT_INCLUDE_DIRS}/*/*.cpp)
file(
    GLOB_RECURSE
    HEADERS
    ${PROJECT_SOURCE_DIRS}/*.hh
    ${PROJECT_SOURCE_DIRS}/*.hpp
    ${PROJECT_INCLUDE_DIRS}/*.hh
    ${PROJECT_INCLUDE_DIRS}/*.hpp
    ${PROJECT_SOURCE_DIRS}/*/*.hh
    ${PROJECT_SOURCE_DIRS}/*/*.hpp
    ${PROJECT_INCLUDE_DIRS}/*/*.hh
    ${PROJECT_INCLUDE_DIRS}/*/*.hpp)

# Exclude any vendor sources and headers from the build
list(
    FILTER
    SOURCES
    EXCLUDE
    REGEX
    ".*(vendor|target|build).*")
list(
    FILTER
    HEADERS
    EXCLUDE
    REGEX
    ".*(vendor|target|build).*")

# Prepare executable
add_executable(${ProjectName} ${SOURCES} ${HEADERS})

# Debug information
message(STATUS "Headers: '${HEADERS}'")
message(STATUS "Sources: '${SOURCES}'")
message(STATUS "IncludeDirs: '${PROJECT_INCLUDE_DIRS}'")

# Add all the include directories and libraries
target_include_directories(
    ${ProjectName}
    PUBLIC ${OPENGL_HEADERS}
           ${GLAD_HEADERS}
           ${GLFW3_HEADERS}
           ${GLM_HEADERS}
           ${SDL2_HEADERS}
           ${PROJECT_INCLUDE_DIRS})

target_link_libraries(
    ${ProjectName}
    INTERFACE project_options
    INTERFACE project_warnings
              ${OPENGL_LIBRARIES}
              ${GLAD_LIBRARIES}
              ${GLFW3_LIBRARIES}
              ${SDL2_LIBRARIES}
              sfml-audio
              sfml-network
              sfml-graphics
              sfml-window
              sfml-system
              ${HEADERS}
              ${SOURCES})
