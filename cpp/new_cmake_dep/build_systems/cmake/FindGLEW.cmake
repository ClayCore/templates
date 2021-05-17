set(GLEW_SEARCH_PATHS ${DEPENDENCIES_PATH}/glew ${LINUX_SEARCH_PATHS})

find_path(
    GLEW_HEADERS
    NAMES GL/glew.h
    HINTS
    PATHS ${GLEW_SEARCH_PATHS}
    PATH_SUFFIXES include
)

# TODO: Separate out all the libraries.
find_library(
    GLEW_LIBRARIES
    NAMES libGLEW.a glew glew32s.lib glew32sd.lib
    HINTS
    PATHS ${GLEW_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

set(GLEW_FOUND "NO")
if(GLEW_HEADERS AND GLEW_LIBRARIES)
    set(GLEW_FOUND "YES")
    message(STATUS "Found required external library: 'GLEW'")
else()
    message(SEND_ERROR "External library 'GLEW' was not found")
endif(GLEW_HEADERS AND GLEW_LIBRARIES)
