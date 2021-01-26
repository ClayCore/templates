message(STATUS "searching for 'GLEW'...")
set(GLAD_SEARCH_PATHS ${DEPENDENCIES_PATH}/glad)

find_path(
    GLAD_HEADERS
    NAMES glad/glad.h
    PATHS ${GLAD_SEARCH_PATHS}
    PATH_SUFFIXES include
)
if (GLAD_HEADERS)
    message(STATUS "found 'GLAD' headers")
endif(GLAD_HEADERS)

set(GLAD_FOUND "NO")
if(GLAD_HEADERS)
    set(GLAD_FOUND "YES")
    message(STATUS "found required external library: 'GLAD'")
else()
    message(SEND_ERROR "external library 'GLAD' was not found")
endif(GLAD_HEADERS)