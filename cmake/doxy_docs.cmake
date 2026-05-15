find_package(Doxygen)

if(DOXYGEN_FOUND)
    ############################################################################################
    ###                                     Define Settings                                  ###
    ############################################################################################

    # set project settings
    set(DOXYGEN_PROJECT_NAME ${LIBNAME})
    set(DOXYGEN_PROJECT_NUMBER ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR})

    # Optional: Set the path to your logo file
    #set(DOXYGEN_PROJECT_LOGO "${CMAKE_CURRENT_SOURCE_DIR}/logo.png")
    # Optional: Set a favicon (requires Doxygen 1.10.0+)
    #set(DOXYGEN_PROJECT_ICON "${CMAKE_CURRENT_SOURCE_DIR}/icon.ico")

    # Output format settings
    set(DOXYGEN_GENERATE_HTML NO)
    set(DOXYGEN_GENERATE_LATEX NO)
    set(DOXYGEN_GENERATE_MAN NO)
    set(DOXYGEN_GENERATE_RTF NO)

    # generate xml so it can be later converted to Godot class documentation
    set(DOXYGEN_GENERATE_XML YES)

    # set directory to create the docs in
    set(DOXYGEN_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/docs)

    # set the project read me file as the content of the main index page of
    # the documentation
    set(DOXYGEN_USE_MDFILE_AS_MAINPAGE "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

    # exclude register_types, and if still present the example class from the
    # godot cpp template
    set(DOXYGEN_EXCLUDE_PATTERNS
            "register_types.h"
            "register_types.cpp"
            "example_class.h"
            "example_class.cpp"
    )

    #todo: Fix so that doxygen input folders are retrieved based on library target source directories
    #[[ add_custom_command(
         TARGET doc_doxygen
         POST_BUILD
         COMMAND ${CMAKE_COMMAND} -E echo " INTERFACES:$<TARGET_PROPERTY:${LIBNAME},INTERFACE_INCLUDE_DIRECTORIES>"
 )]]

    # configure input directories, this tells doxygen where to look for content
    # to document
    set(DOX_INPUT
            "${CMAKE_CURRENT_SOURCE_DIR}/src"
    )

    ############################################################################################
    ###                                 Generate Docs                                        ###
    ############################################################################################

    # Generate the Doxyfile and documentation when the target
    # is doc_doxygen
    doxygen_add_docs(doc_doxygen
            ${DOX_INPUT}
            ${CMAKE_CURRENT_SOURCE_DIR}/README.md
            COMMENT "Generating Doxygen docs"
    )


    # call python script to convert doxygen xml to Godot class documentation xml
    add_custom_command(
            TARGET doc_doxygen
            POST_BUILD
            COMMAND Python3::Interpreter "${CMAKE_CURRENT_SOURCE_DIR}/cmake/doxy_to_godot.py"
            "${DOXYGEN_OUTPUT_DIRECTORY}/xml"
            "${CMAKE_CURRENT_SOURCE_DIR}/doc_classes"
            COMMENT "Generating Godot class documentation"
            VERBATIM
    )

endif()
