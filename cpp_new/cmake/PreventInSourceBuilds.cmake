# Prevent in-source builds
# function(AssureOutOfSourceBuilds)
#     get_filename_component(srcdir "${CMAKE_SOURCE_DIR}" REALPATH)
#     get_filename_component(bindir "${CMAKE_SOURCE_DIR}" REALPATH)
    
#     if("${srcdir}" STREQUAL "${bindir}")
#         message("######################################################")
#         message("Warning: in-source builds are disabled")
#         message("Please create a separate build directory and run cmake from there")
#         message("######################################################")
#         message(WARNING "Quitting configuration")
#     endif()
# endfunction()

# AssureOutOfSourceBuilds()
