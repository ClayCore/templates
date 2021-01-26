message(STATUS "searching for 'SDL2'...")
set(SDL2_SEARCH_PATHS ${DEPENDENCIES_PATH}/sdl2)

find_path(
    SDL2_HEADERS
    NAMES SDL2/SDL.h
    PATHS ${SDL2_SEARCH_PATHS}
    PATH_SUFFIXES include
)
if(SDL2_HEADERS)
    message(STATUS "found 'SDL2' headers")
endif(SDL2_HEADERS)

find_library(
    SDL2_LIBRARIES
    NAMES libSDL2.a
    PATHS ${SDL2_SEARCH_PATHS}
    PATH_SUFFIXES lib
)
if(SDL2_LIBRARIES)
    message(STATUS "found 'SDL2' libraries")
endif(SDL2_LIBRARIES)

set(SDL2_FOUND "NO")
if (SDL2_HEADERS AND SDL2_LIBRARIES)
    set(SDL2_FOUND "YES")
    message(STATUS "found required external library: 'SDL2'")
else()
    message(SEND_ERROR "external library 'SDL2' was not found")
endif(SDL2_HEADERS AND SDL2_LIBRARIES)