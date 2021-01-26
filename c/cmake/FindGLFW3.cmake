message(STATUS "searching for 'GLFW3'...")
set(GLFW3_SEARCH_PATHS ${DEPENDENCIES_PATH}/glfw3)

find_path(
    GLFW3_HEADERS
    NAMES GLFW/glfw3.h
    PATHS ${GLFW3_SEARCH_PATHS}
    PATH_SUFFIXES include
)
if(GLFW3_HEADERS)
    message(STATUS "found 'GLFW3' headers")
endif(GLFW3_HEADERS)

find_library(
    GLFW3_LIBRARIES
    NAMES glfw3 libglfw3.a libglfw.a glfw
    PATHS ${GLFW3_SEARCH_PATHS}
    PATH_SUFFIXES lib
)
if(GLFW3_LIBRARIES)
    message(STATUS "found 'GLFW3' libraries")
endif(GLFW3_LIBRARIES)

set(GLFW3_FOUND "NO")
if(GLFW3_HEADERS AND GLFW3_LIBRARIES)
    set(GLFW3_FOUND "YES")
    message(STATUS "found required external library: 'GLFW3'")
else()
    message(SEND_ERROR "external library 'GLFW3' was not found")
endif(GLFW3_HEADERS AND GLFW3_LIBRARIES)