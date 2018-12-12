CXXFLAGS_append_ti-am335x =" ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '-DSUPPORT_X11', '', d)}"
