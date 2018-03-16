dnl AG_WST_INIT
dnl sets up use of wst configure.ac macros
dnl all wst autoconf macros are prefixed
dnl with AG_WST_ for public macros
dnl with _AG_WST_ for private macros
dnl
dnl We call AC_CANONICAL_TARGET and AC_CANONICAL_HOST so that
dnl it is valid before AC_ARG_PROGRAM is called

AC_DEFUN([AG_WST_INIT],
[
    m4_pattern_forbid(^_?AG_WST_)
    AC_REQUIRE([AC_CANONICAL_HOST]) dnl we use host_ variables
    AC_REQUIRE([AC_CANONICAL_TARGET]) dnl we use target_ variables
])


dnl AG_WST_PKG_CONFIG_PATH
dnl
dnl sets up a WST_PKG_CONFIG_PATH variable for use in Makefile.am
dnl which contains the path of the in-tree pkgconfig directory first
dnl and then any paths specified in PKG_CONFIG_PATH
dnl
dnl We do this mostly so we don't have to use unportable shell constructs
dnl such as ${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH} in Makefile.am to handle
dnl the case where the environment variable is not set, but also in order
dnl to avoid a trailing ':' in the PKG_CONFIG_PATH which apparently causes
AC_DEFUN([AG_WST_PKG_CONFIG_PATH],
[
    WST_PKG_CONFIG_PATH="\$(top_builddir)/pkgconfig"
    if test "x$PKG_CONFIG_PATH" != "x"; then
        WST_PKG_CONFIG_PATH="$WST_PKG_CONFIG_PATH:$PKG_CONFIG_PATH"
    fi
    AC_SUBST([WST_PKG_CONFIG_PATH])
    AC_MSG_NOTICE([Using WST_PKG_CONFIG_PATH = $WST_PKG_CONFIG_PATH])
])
