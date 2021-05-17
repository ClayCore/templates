set(GLAD_SEARCH_PATHS ${ProjectDependencies}/glad ${LINUX_SEARCH_PATHS})

find_path(
    GLAD_HEADERS
    NAMES glad/glad.h
    HINTS
    PATHS ${GLAD_SEARCH_PATHS}
    PATH_SUFFIXES include)

set(GLAD_FOUND "NO")
if(GLAD_HEADERS)
    set(GLAD_FOUND "YES")
    message(STATUS "Found required external library: 'GLAD'")
else()
    message(SEND_ERROR "External library 'GLAD' was not found")
endif(GLAD_HEADERS)
