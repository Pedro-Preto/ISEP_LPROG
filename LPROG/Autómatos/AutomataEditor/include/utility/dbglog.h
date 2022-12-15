#ifndef _DBGLOG_H_1638486468879_
#define _DBGLOG_H_1638486468879_

#include <QtDebug>


#define STRNUMB_HELP(x) #x
#define STRNUMB(x) STRNUMB_HELP(x)

// TODO: define in other way if __FUNCTION__ not defined - handle most possibilities
// this is for gcc
#if __STDC_VERSION__ < 199901L
#   if __GNUC__ >= 2
#       if defined(__PRETTY_FUNCTION__)
#           define __func__ __PRETTY_FUNCTION__
#       else
#           define __func__ __FILE__ " / " STRNUMB(__LINE__) ": " << __FUNCTION__
#       endif
#   else
#       define __func__ "<unknown>"
#   endif
#endif

// in VS2005 it's defined as macro
#if defined(__FUNCTION__)
#   define CURRENT_FUNCTION_NAME __FUNCTION__
#elif defined(__func__)
#   define CURRENT_FUNCTION_NAME __func__
#else
#   define CURRENT_FUNCTION_NAME "<unknown>"
#endif

//! Debug logging macros - define own macros for granulating log messages
#define DBGLOG_PURE(x) do { qDebug() << x; } while(false)

//! Debugging macros with identifiers printed first (eg. define user macro #define DBGLOG_MODULE(x) DBGLOG("MODULE", x)
#define DBGLOG_(id, x) DBGLOG_PURE("<"id">\t" << CURRENT_FUNCTION_NAME << "->" << x)

//! General debugging macro
#define DBGLOG(x) DBGLOG_("EDITOR", x)

//! for easily parameters logging
#define DBGPAR(PAR) #PAR << "=" << PAR << " "

//! release messages (used qWarning, so make sure that QT_NO_WARNING_OUTPUT isn't defined)
#define RELLOG_PURE(x) do { qWarning() << x; } while(false)
#define RELLOG_(id, x) RELLOG_PURE("<"id">\t" << "->" << x)
#define RELLOG(x) RELLOG_("EDITOR", x)


#endif //_DBGLOG_H_1638486468879_
