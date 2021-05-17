set(SFML_SEARCH_PATHS ${DEPENDENCIES_PATH}/sfml ${LINUX_SEARCH_PATHS})

find_path(
    SFML_HEADERS
    NAMES SFML/Graphics.hpp
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES include
)

find_library(
    SFML_LIBRARY_GRAPHICS
    NAMES libsfml-graphics-s
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

find_library(
    SFML_LIBRARY_WINDOW
    NAMES libsfml-window-s
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

find_library(
    SFML_LIBRARY_SYSTEM
    NAMES libsfml-system-s
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

find_library(
    SFML_LIBRARY_AUDIO
    NAMES libsfml-audio-s
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

find_library(
    SFML_LIBRARY_NETWORK
    NAMES libsfml-network-s
    PATHS ${SFML_SEARCH_PATHS}
    PATH_SUFFIXES lib
)

set(SFML_LIBRARIES ${SFML_LIBRARY_AUDIO} ${SFML_LIBRARY_NETWORK} ${SFML_LIBRARY_GRAPHICS} ${SFML_LIBRARY_WINDOW} ${SFML_LIBRARY_SYSTEM})

set(SFML_FOUND "NO")
if(SFML_HEADERS AND SFML_LIBRARIES)
    set(SFML_FOUND "YES")
    message(STATUS "Found required external library: 'SFML'")
else()
    message(SEND_ERROR "External library 'SFML' was not found")
endif(SFML_HEADERS AND SFML_LIBRARIES)
