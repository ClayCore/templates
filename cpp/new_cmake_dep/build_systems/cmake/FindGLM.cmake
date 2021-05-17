set(GLM_SEARCH_PATHS ${DEPENDENCIES_PATH}/glm ${LINUX_SEARCH_PATHS})

find_path(
    GLM_HEADERS
    NAMES glm.hpp
    HINTS
    PATHS ${GLM_SEARCH_PATHS}
    PATH_SUFFIXES include
)

set(GLM_FOUND "NO")
if(GLM_HEADERS)
    set(GLM_FOUND "YES")
    message(STATUS "Found required external library: 'GLM'")
else()
    message(SEND_ERROR "External library 'GLM' was not found")
endif(GLM_HEADERS)
