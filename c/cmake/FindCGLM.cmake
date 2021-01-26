message(STATUS "searching for 'CGLM'...")
set(CGLM_SEARCH_PATHS ${DEPENDENCIES_PATH}/cglm)

find_path(
    CGLM_HEADERS
    NAMES cglm/cglm.h
    PATHS ${CGLM_SEARCH_PATHS}
    PATH_SUFFIXES include
)
if(CGLM_HEADERS)
    message(STATUS "found 'CGLM' headers")
endif (CGLM_HEADERS)

find_library(
    CGLM_LIBRARIES
    NAMES cglm.lib
    PATHS ${CGLM_SEARCH_PATHS}
    PATH_SUFFIXES lib
)
if(CGLM_LIBRARIES)
    message(STATUS "found 'CGLM' headers")
endif (CGLM_LIBRARIES)

set(CGLM_FOUND "NO")
if(CGLM_HEADERS AND CGLM_LIBRARIES)
    set(CGLM_FOUND "YES")
    message(STATUS "found required external library: 'CGLM'")
else()
    message(SEND_ERROR "external library 'CGLM' was not found")
endif(CGLM_HEADERS AND CGLM_LIBRARIES)