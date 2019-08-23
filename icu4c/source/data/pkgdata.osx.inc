GENCCODE_ASSEMBLY_TYPE=-a gcc-darwin
SO=dylib
SOBJ=dylib
A=a
LIBPREFIX=lib
LIB_EXT_ORDER=.61.1.a
COMPILE=/usr/bin/clang -DU_ATTRIBUTE_DEPRECATED=   -DU_ENABLE_DYLOAD=0 -DU_HAVE_ATOMIC=1 -DU_HAVE_STRTOD_L=1 -arch x86_64 -mmacosx-version-min=10.8 -DU_CHARSET_IS_UTF8=1 -DU_CHAR_TYPE=uint_least16_t -DU_CHARSET_IS_UTF8=1 -DU_CHAR_TYPE=uint_least16_t -DUCONFIG_NO_LEGACY_CONVERSION=1 -DUCONFIG_NO_BREAK_ITERATION=1 -fvisibility=hidden -g -Os -std=c99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -fno-common -c
LIBFLAGS=-static
GENLIB=/usr/bin/clang -staticlib -static -arch x86_64 -mmacosx-version-min=10.8 -DU_CHARSET_IS_UTF8=1 -DU_CHAR_TYPE=uint_least16_t -DU_CHARSET_IS_UTF8=1 -DU_CHAR_TYPE=uint_least16_t -DUCONFIG_NO_LEGACY_CONVERSION=1 -DUCONFIG_NO_BREAK_ITERATION=1 -fvisibility=hidden -g -Os -std=c99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings   -Wl,-search_paths_first -arch x86_64 -mmacosx-version-min=10.8
LDICUDTFLAGS=
LD_SONAME=-Wl,-compatibility_version -Wl,61 -Wl,-current_version -Wl,61.1 -install_name
RPATH_FLAGS=
BIR_LDFLAGS=
AR=libtool
ARFLAGS=-o
RANLIB=/usr/bin/ranlib
INSTALL_CMD=/usr/local/bin/ginstall -c