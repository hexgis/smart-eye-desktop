
#ifndef PYTHON_EXPORT_H
#define PYTHON_EXPORT_H

#ifdef PYTHON_STATIC_DEFINE
#  define PYTHON_EXPORT
#  define PYTHON_NO_EXPORT
#else
#  ifndef PYTHON_EXPORT
#    ifdef qgispython_EXPORTS
        /* We are building this library */
#      define PYTHON_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define PYTHON_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef PYTHON_NO_EXPORT
#    define PYTHON_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef PYTHON_DEPRECATED
#  define PYTHON_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef PYTHON_DEPRECATED_EXPORT
#  define PYTHON_DEPRECATED_EXPORT PYTHON_EXPORT PYTHON_DEPRECATED
#endif

#ifndef PYTHON_DEPRECATED_NO_EXPORT
#  define PYTHON_DEPRECATED_NO_EXPORT PYTHON_NO_EXPORT PYTHON_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef PYTHON_NO_DEPRECATED
#    define PYTHON_NO_DEPRECATED
#  endif
#endif

#endif
