cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
project(MAPBOX_ICU LANGUAGES CXX C)

# Required to avoid warnings when setting visibility
cmake_policy(SET CMP0063 NEW)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

set(ICU_COMPILE_DEFINITIONS
    UCONFIG_NO_BREAK_ITERATION=1
    UCONFIG_NO_LEGACY_CONVERSION=1
    U_ATTRIBUTE_DEPRECATED=
    U_CHARSET_IS_UTF8=1
    U_CHAR_TYPE=uint_least16_t
    U_ENABLE_DYLOAD=0
    U_HAVE_ATOMIC=1
    U_HAVE_STRTOD_L=1
    U_STATIC_IMPLEMENTATION=1
    U_USE_STRTOD_L=0
)

include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/icuuc.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/icui18n.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/icudata.cmake)

add_library(icu INTERFACE)

target_include_directories(icu SYSTEM INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n
)

target_link_libraries(icu INTERFACE
    icui18n
    icuuc
    icudata
)
