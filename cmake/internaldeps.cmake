############################################################################
#
#   file        : internaldeps.cmake
#   copyright   : (C) 2008 by Mart Kelder, 2010 by J.-P. Meuret
#   web         : www.speed-dreams.org 
#   version     : $Id$
#
############################################################################

############################################################################
#                                                                          #
#   This program is free software; you can redistribute it and/or modify   #
#   it under the terms of the GNU General Public License as published by   #
#   the Free Software Foundation; either version 2 of the License, or      #
#   (at your option) any later version.                                    #
#                                                                          #
############################################################################

# @file     Internal dependencies (include and libs)
# @author   Mart Kelder, J.-P. Meuret
# @version  $Id$

# SD include dirs macros.
MACRO(ADD_INTERFACE_INCLUDEDIR)

  IF(IN_SOURCETREE)
    SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/interfaces)
  ELSE(IN_SOURCETREE)
    SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
  ENDIF(IN_SOURCETREE)
  
  FIND_PATH(INTERFACE_INCLUDE_DIR raceman.h 
            PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
  FIND_PATH(INTERFACE_INCLUDE_DIR raceman.h 
            PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
  MARK_AS_ADVANCED(INTERFACE_INCLUDE_DIR)
  IF(INTERFACE_INCLUDE_DIR)
    INCLUDE_DIRECTORIES(${INTERFACE_INCLUDE_DIR})
  ELSE(INTERFACE_INCLUDE_DIR)
    MESSAGE(FATAL_ERROR "Cannot find interface header files")
  ENDIF(INTERFACE_INCLUDE_DIR)

ENDMACRO(ADD_INTERFACE_INCLUDEDIR)

MACRO(ADD_SDLIB_INCLUDEDIR)

  SET(SDLIB_OPTIONAL FALSE)

  FOREACH(SDLIB_LIB ${ARGN})

    IF(${SDLIB_LIB} STREQUAL "OPTIONAL")
      SET(SDLIB_OPTIONAL TRUE)
    ENDIF(${SDLIB_LIB} STREQUAL "OPTIONAL")

  ENDFOREACH(SDLIB_LIB ${ARGN})

  FOREACH(SDLIB_LIB ${ARGN})

    SET(SDLIB_FOUND_LIB TRUE)
    SET(SDLIB_EXTRA_INCLUDEDIR "")
    IF(SDLIB_LIB STREQUAL "portability")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/portability)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_PORTABILITY_INCLUDE_DIR portability.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_PORTABILITY_INCLUDE_DIR portability.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_PORTABILITY_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_PORTABILITY_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "tgf")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/tgf)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_TGF_INCLUDE_DIR tgf.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_TGF_INCLUDE_DIR tgf.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_TGF_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_TGF_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "tgfclient")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/tgfclient)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_TGFCLIENT_INCLUDE_DIR tgfclient.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_TGFCLIENT_INCLUDE_DIR tgfclient.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_TGFCLIENT_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_TGFCLIENT_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "tgfdata")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/tgfdata)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_TGFDATA_INCLUDE_DIR tgfdata.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_TGFDATA_INCLUDE_DIR tgfdata.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_TGFDATA_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_TGFDATA_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "math")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/math)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_MATH_INCLUDE_DIR linalg_t.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include PATH_SUFFIXES "" math tmath NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_MATH_INCLUDE_DIR linalg_t.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include PATH_SUFFIXES "" math tmath)
      MARK_AS_ADVANCED(SDLIB_MATH_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_MATH_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "txml")
      # Temporary, as TXML will finally get replaced by Expat.
      IF(NOT OPTION_3RDPARTY_EXPAT)
        IF(IN_SOURCETREE)
          SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/txml)
        ELSE(IN_SOURCETREE)
          SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
        ENDIF(IN_SOURCETREE)
        FIND_PATH(SDLIB_TXML_INCLUDE_DIR xml.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
        FIND_PATH(SDLIB_TXML_INCLUDE_DIR xml.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
        MARK_AS_ADVANCED(SDLIB_TXML_INCLUDE_DIR)
        SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_TXML_INCLUDE_DIR)
      ELSE(NOT OPTION_3RDPARTY_EXPAT)
        SET(SDLIB_FOUND_LIB FALSE)
      ENDIF(NOT OPTION_3RDPARTY_EXPAT)
    ELSEIF(SDLIB_LIB STREQUAL "robottools")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/robottools)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_ROBOTTOOLS_INCLUDE_DIR robottools.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_ROBOTTOOLS_INCLUDE_DIR robottools.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_ROBOTTOOLS_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_ROBOTTOOLS_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "learning")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/libs/learning)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_LEARNING_INCLUDE_DIR learn_debug.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include PATH_SUFFIXES "" learning NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_LEARNING_INCLUDE_DIR learn_debug.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include PATH_SUFFIXES "" learning)
      MARK_AS_ADVANCED(SDLIB_LEARNING_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_LEARNING_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "networking")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/modules/networking)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_NETWORKING_INCLUDE_DIR network.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_NETWORKING_INCLUDE_DIR network.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_NETWORKING_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_NETWORKING_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "csnetworking")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/modules/csnetworking)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_CSNETWORKING_INCLUDE_DIR csnetwork.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_CSNETWORKING_INCLUDE_DIR csnetwork.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_CSNETWORKING_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_CSNETWORKING_INCLUDE_DIR)
    ELSEIF(SDLIB_LIB STREQUAL "standardgame")
      IF(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SOURCE_DIR}/src/modules/racing/standardgame)
      ELSE(IN_SOURCETREE)
        SET(INCLUDE_CANDIDATE ${SD_INCLUDEDIR_ABS})
      ENDIF(IN_SOURCETREE)
      FIND_PATH(SDLIB_STANDARDGAME_INCLUDE_DIR standardgame.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include NO_DEFAULT_PATH)
      FIND_PATH(SDLIB_STANDARDGAME_INCLUDE_DIR standardgame.h PATHS ${INCLUDE_CANDIDATE} /usr/include /usr/local/include)
      MARK_AS_ADVANCED(SDLIB_STANDARDGAME_INCLUDE_DIR)
      SET(SDLIB_EXTRA_INCLUDEDIR SDLIB_STANDARDGAME_INCLUDE_DIR)
    ELSE(SDLIB_LIB STREQUAL "portability")
      SET(SDLIB_FOUND_LIB FALSE)
      IF(NOT SDLIB_LIB STREQUAL "OPTIONAL")
        MESSAGE(WARNING ": ${SDLIB_LIB} is not a Speed Dreams library")
      ENDIF(NOT SDLIB_LIB STREQUAL "OPTIONAL")
    ENDIF(SDLIB_LIB STREQUAL "portability")
    IF(SDLIB_FOUND_LIB)
      IF(${SDLIB_EXTRA_INCLUDEDIR})
        SET(SDLIB_INCLUDE_DIRS ${SDLIB_INCLUDE_DIRS} ${${SDLIB_EXTRA_INCLUDEDIR}})
      ELSE(${SDLIB_EXTRA_INCLUDEDIR})
        IF(NOT SDLIB_OPTIONAL AND NOT SDLIB_LIB STREQUAL "OPTIONAL")
          MESSAGE(FATAL_ERROR "Cannot find ${SDLIB_LIB} library header files")
        ENDIF(NOT SDLIB_OPTIONAL AND NOT SDLIB_LIB STREQUAL "OPTIONAL")
      ENDIF(${SDLIB_EXTRA_INCLUDEDIR})
    ENDIF(SDLIB_FOUND_LIB)

  ENDFOREACH(SDLIB_LIB ${SDLIB_LIBS})

  INCLUDE_DIRECTORIES(${SDLIB_INCLUDE_DIRS})

ENDMACRO(ADD_SDLIB_INCLUDEDIR)

# SD libraries macro.
MACRO(ADD_SDLIB_LIBRARY TARGET)

  SET(SDLIB_OPTIONAL FALSE)
  SET(SDLIB_STATIC FALSE)
  SET(SDLIB_TARGET_SUFFIX "")

  FOREACH(SDLIB_LIB ${ARGN})
    IF(${SDLIB_LIB} STREQUAL "OPTIONAL")
      SET(SDLIB_OPTIONAL TRUE)
    ENDIF(${SDLIB_LIB} STREQUAL "OPTIONAL")
    IF(${SDLIB_LIB} STREQUAL "STATIC")
      SET(SDLIB_STATIC TRUE)
      SET(SDLIB_TARGET_SUFFIX "_static")
    ENDIF(${SDLIB_LIB} STREQUAL "STATIC")
  ENDFOREACH(SDLIB_LIB ${ARGN})

  FOREACH(SDLIB_LIB ${ARGN})

    SET(SDLIB_IGNORE TRUE)
    IF(NOT UNIX)
      SET(SDLIB_IGNORE FALSE)
    ELSEIF(NOT SDLIB_LIB STREQUAL "ssggraph" AND NOT SDLIB_LIB STREQUAL "osggraph" AND NOT SDLIB_LIB STREQUAL "track")
      SET(SDLIB_IGNORE FALSE)
    ENDIF(NOT UNIX)
    IF(SDLIB_LIB STREQUAL "OPTIONAL" OR SDLIB_LIB STREQUAL "STATIC")
      SET(SDLIB_IGNORE TRUE) #Ignore: not a real target
    ENDIF(SDLIB_LIB STREQUAL "OPTIONAL" OR SDLIB_LIB STREQUAL "STATIC")

    IF(SDLIB_LIB STREQUAL "txml" AND OPTION_3RDPARTY_EXPAT)
      SET(SDLIB_IGNORE TRUE) #Ignore: Use Expat
    ENDIF(SDLIB_LIB STREQUAL "txml" AND OPTION_3RDPARTY_EXPAT)
    
    IF(SDLIB_LIB STREQUAL "solid" AND OPTION_3RDPARTY_SOLID)
      SET(SDLIB_IGNORE TRUE) #Ignore: Use 3rd party SOLID
    ENDIF(SDLIB_LIB STREQUAL "solid" AND OPTION_3RDPARTY_SOLID)
    
    IF(NOT SDLIB_IGNORE)

      SET(SDLIB_FOUND_LIB TRUE)
      SET(SDLIB_EXTRA_LIBRARY "")

      #Use IF(TARGET ${SDLIB_LIB}) from CMake 2.6
	  IF(CMAKE_MAJOR_VERSION GREATER 2)
		cmake_policy(SET CMP0026 OLD)
		cmake_policy(SET CMP0045 OLD)
	  ENDIF()
	  
      GET_TARGET_PROPERTY(SDLIB_TARGET_LOCATION ${SDLIB_LIB}${SDLIB_TARGET_SUFFIX} LOCATION)
      IF(NOT SDLIB_TARGET_LOCATION STREQUAL "NOTFOUND")
        SET(SDLIB_LIBRARIES ${SDLIB_LIBRARIES} ${SDLIB_LIB}${SDLIB_TARGET_SUFFIX})
      ELSE(NOT SDLIB_TARGET_LOCATION STREQUAL "NOTFOUND")
        MESSAGE(WARNING "Warning: didn't found target ${SDLIB_LIB}")
        IF(SDLIB_LIB STREQUAL "portability")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/portability)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_PORTABILITY_LIBRARY portability${SDLIB_TARGET_SUFFIX} PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib
                       PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_PORTABILITY_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "tgf")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/tgf)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_TGF_LIBRARY tgf${SDLIB_TARGET_SUFFIX} PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib
                       PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_TGF_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "tgfclient")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/tgfclient)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_TGFCLIENT_LIBRARY tgfclient PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_TGFCLIENT_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "tgfdata")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/tgfdata)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_TGFDATA_LIBRARY tgfdata PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_TGFDATA_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "txml")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/txml)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_TXML_LIBRARY txml${SDLIB_TARGET_SUFFIX} PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib
                       PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_TXML_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "robottools")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/robottools)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_ROBOTTOOLS_LIBRARY robottools PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_ROBOTTOOLS_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "learning")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/libs/learning)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_LEARNING_LIBRARY learning PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_LEARNING_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "networking")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/networking)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_NETWORKING_LIBRARY networking PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_NETWORKING_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "csnetworking")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/csnetworking)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_CSNETWORKING_LIBRARY csnetworking PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_CSNETWORKING_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "standardgame")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/racing/standardgame)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_STANDARDGAME_LIBRARY standardgame PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_STANDARDGAME_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "legacymenu")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/userinterface/legacymenu)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_LEGACYMENU_LIBRARY legacymenu ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_LEGACYMENU_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "ssggraph")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/graphic/ssggraph)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_SSGGRAPH_LIBRARY ssggraph PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_SSGGRAPH_LIBRARY)
		ELSEIF(SDLIB_LIB STREQUAL "osggraph")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/graphic/osggraph)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_OSGGRAPH_LIBRARY osggraph PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_OSGGRAPH_LIBRARY)
        ELSEIF(SDLIB_LIB STREQUAL "track")
          IF(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SOURCE_DIR}/src/modules/track)
          ELSE(IN_SOURCETREE)
            SET(LIBRARY_CANDIDATE ${SD_LIBDIR_ABS})
          ENDIF(IN_SOURCETREE)
          FIND_LIBRARY(SDLIB_TRACK_LIBRARY track PATHS ${LIBRARY_CANDIDATE} /usr/lib /usr/local/lib PATH_SUFFIXES "" lib)
          SET(SDLIB_EXTRA_LIBRARY SDLIB_TRACK_LIBRARY)
        ELSE(SDLIB_LIB STREQUAL "tgf")
          SET(SDLIB_FOUND_LIB FALSE)
          IF(NOT SDLIB_LIB STREQUAL "OPTIONAL" AND NOT SDLIB_LIB STREQUAL "STATIC")
            MESSAGE(WARNING ": ${SDLIB_LIB} is not a Speed Dreams library")
          ENDIF(NOT SDLIB_LIB STREQUAL "OPTIONAL" AND NOT SDLIB_LIB STREQUAL "STATIC")
        ENDIF(SDLIB_LIB STREQUAL "portability")

        IF(SDLIB_FOUND_LIB)
          IF(${SDLIB_EXTRA_LIBRARY})
            SET(SDLIB_LIBRARIES ${SDLIB_LIBRARIES} ${${SDLIB_EXTRA_LIBRARY}})
          ELSE(${SDLIB_EXTRA_LIBRARY})
            IF(NOT SDLIB_OPTIONAL AND NOT SDLIB_LIB STREQUAL "OPTIONAL" AND NOT SDLIB_LIB STREQUAL "STATIC")
              MESSAGE(FATAL_ERROR "Cannot find ${SDLIB_LIB} library shared object")
            ENDIF(NOT SDLIB_OPTIONAL AND NOT SDLIB_LIB STREQUAL "OPTIONAL" AND NOT SDLIB_LIB STREQUAL "STATIC")
          ENDIF(${SDLIB_EXTRA_LIBRARY})
        ENDIF(SDLIB_FOUND_LIB)

      ENDIF(NOT SDLIB_TARGET_LOCATION STREQUAL "NOTFOUND")

    ENDIF(NOT SDLIB_IGNORE)

  ENDFOREACH(SDLIB_LIB ${SDLIB_LIBS})

  #MESSAGE(STATUS "TARGET_LINK_LIBRARIES(${TARGET} ${SDLIB_LIBRARIES})")
  TARGET_LINK_LIBRARIES(${TARGET} ${SDLIB_LIBRARIES})

ENDMACRO(ADD_SDLIB_LIBRARY TARGET)
