
#ifndef GRASS_LIB_EXPORT_H
#define GRASS_LIB_EXPORT_H

#ifdef GRASS_LIB_STATIC_DEFINE
#  define GRASS_LIB_EXPORT
#  define GRASS_LIB_NO_EXPORT
#else
#  ifndef GRASS_LIB_EXPORT
#    ifdef qgisgrass7_EXPORTS
        /* We are building this library */
#      define GRASS_LIB_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define GRASS_LIB_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef GRASS_LIB_NO_EXPORT
#    define GRASS_LIB_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef GRASS_LIB_DEPRECATED
#  define GRASS_LIB_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef GRASS_LIB_DEPRECATED_EXPORT
#  define GRASS_LIB_DEPRECATED_EXPORT GRASS_LIB_EXPORT GRASS_LIB_DEPRECATED
#endif

#ifndef GRASS_LIB_DEPRECATED_NO_EXPORT
#  define GRASS_LIB_DEPRECATED_NO_EXPORT GRASS_LIB_NO_EXPORT GRASS_LIB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef GRASS_LIB_NO_DEPRECATED
#    define GRASS_LIB_NO_DEPRECATED
#  endif
#endif

#endif
