FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://xorg.conf"

do_install:append() {
    rm -f ${D}${sysconfdir}/X11/xorg.conf
    install -d ${D}${sysconfdir}/X11
    install -m 0644 ${WORKDIR}/xorg.conf ${D}${sysconfdir}/X11/xorg.conf
}

FILES:${PN} += "${sysconfdir}/X11/xorg.conf"