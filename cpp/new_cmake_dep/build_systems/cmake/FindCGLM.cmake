set(CGLM_SEARCH_PATHS ${DEPENDENCIES_PATH}/cglm ${LINUX_SEARCH_PATHS})

find_path(
    CGLM_HEADERS
    NAMES cglm/cglm.h
    HINTS
    PATHS ${CGLM_SEARCH_PATHS}
    PATH_SUFFIXES include
)

find_library(
    CGLM_LIBRARIES
    NAMES cglm.lib
    HINTS
    PATHS ${CGLM_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

set(CGLM_FOUND "NO")
if(CGLM_HEADERS AND CGLM_LIBRARIES)
    set(CGLM_FOUND "YES")
    message(STATUS "Found required external library: 'CGLM'")
else()
    message(SEND_ERROR "External library 'CGLM' was not found")
endif(CGLM_HEADERS AND CGLM_LIBRARIES)
