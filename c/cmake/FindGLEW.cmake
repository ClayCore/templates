message(STATUS "searching for 'GLEW'...")
set(GLEW_SEARCH_PATHS ${DEPENDENCIES_PATH}/glew)

find_path(
    GLEW_HEADERS
    NAMES GL/glew.h
    PATHS ${GLEW_SEARCH_PATHS}
    PATH_SUFFIXES include
)
if(GLEW_HEADERS)
    message(STATUS "found 'GLEW' headers")
endif(GLEW_HEADERS)

find_library(
    GLEW_LIBRARIES
    NAMES libGLEW.a glew glew32s.lib glew32sd.lib
    PATHS ${GLEW_SEARCH_PATHS}
    PATH_SUFFIXES lib
)
if(GLEW_LIBRARIES)
    message(STATUS "found 'GLEW' libraries")
endif(GLEW_LIBRARIES)

set(GLEW_FOUND "NO")
if(GLEW_HEADERS AND GLEW_LIBRARIES)
    set(GLEW_FOUND "YES")
    message(STATUS "found required external library: 'GLEW'")
else()
    message(SEND_ERROR "external library 'GLEW' was not found")
endif(GLEW_HEADERS AND GLEW_LIBRARIES)