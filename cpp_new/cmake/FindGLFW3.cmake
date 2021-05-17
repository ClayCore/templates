set(GLFW3_SEARCH_PATHS ${ProjectDependencies}/glfw3 ${LINUX_SEARCH_PATHS})

find_path(
    GLFW3_HEADERS
    NAMES GLFW/glfw3.h
    HINTS
    PATHS ${GLFW3_SEARCH_PATHS}
    PATH_SUFFIXES include)

# TODO: Separate out all the libraries.
find_library(
    GLFW3_LIBRARIES
    NAMES glfw3
          libglfw3.a
          libglfw.a
          glfw
    HINTS
    PATHS ${GLFW3_SEARCH_PATHS}
    PATH_SUFFIXES lib)

set(GLFW3_FOUND "NO")
if(GLFW3_HEADERS AND GLFW3_LIBRARIES)
    set(GLFW3_FOUND "YES")
    message(STATUS "Found required external library: 'GLFW3'")
else()
    message(SEND_ERROR "External library 'GLFW3' was not found")
endif(GLFW3_HEADERS AND GLFW3_LIBRARIES)
