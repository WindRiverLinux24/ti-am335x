do_install_append_ti-am335x () {
    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
}
