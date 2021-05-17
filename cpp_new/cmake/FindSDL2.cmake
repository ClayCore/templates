set(SDL2_SEARCH_PATHS ${ProjectDependencies}/sdl2 ${LINUX_SEARCH_PATHS})

find_path(
    SDL2_HEADERS
    NAMES SDL2/SDL.h
    HINTS
    PATHS ${SDL2_SEARCH_PATHS}
    PATH_SUFFIXES include)

find_library(
    SDL2_LIBRARY_TEMP
    NAMES SDL2
    HINTS
    PATHS ${SDL2_SEARCH_PATHS}
    PATH_SUFFIXES lib)

find_library(
    SDL2_MAIN_LIBRARY
    NAMES SDL2main
    HINTS
    PATHS ${SDL2_SEARCH_PATHS}
    PATH_SUFFIXES lib)

# Only add the main lib if its found
if(SDL2_LIBRARY_TEMP)
    if(SDL2_MAIN_LIBRARY)
        set(SDL2_LIBRARY_TEMP ${SDL2_MAIN_LIBRARY} ${SDL2_LIBRARY_TEMP})
    endif(SDL2_MAIN_LIBRARY)
endif(SDL2_LIBRARY_TEMP)

# Concatenate all the libraries
set(SDL2_LIBRARIES ${SDL2_LIBRARY_TEMP})

set(SDL2_FOUND "NO")
if(SDL2_HEADERS AND SDL2_LIBRARIES)
    set(SDL2_FOUND "YES")
    message(STATUS "Found required external library: 'SDL2'")
else()
    message(SEND_ERROR "External library 'SDL2' was not found")
endif(SDL2_HEADERS AND SDL2_LIBRARIES)
