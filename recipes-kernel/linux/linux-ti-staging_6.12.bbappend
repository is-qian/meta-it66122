SUMMARY = "bitbake-layers recipe"
DESCRIPTION = "Recipe created by bitbake-layers"
LICENSE = "MIT"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += " \
    file://external/bbb.io/0001-Add-BeagleBoard.org-Device-Tree-Changes.patch \
    file://backports/it66121/0001-backports-it66121-from-linux.git.patch \
    file://mainline/ite-it66121/0001-drm-bridge-it66121-Convert-to-i2c-s-.probe_new.patch \
    file://mainline/ite-it66121/0002-drm-bridge-it66121-Use-devm_regulator_bulk_get_enabl.patch \
    file://mainline/ite-it66121/0003-drm-bridge-it66121-Use-regmap_noinc_read.patch \
    file://mainline/ite-it66121/0004-drm-bridge-it66121-Write-AVI-infoframe-with-regmap_b.patch \
    file://mainline/ite-it66121/0005-drm-bridge-it66121-Fix-wait-for-DDC-ready.patch \
    file://mainline/ite-it66121/0006-drm-bridge-it66121-Don-t-use-DDC-error-IRQs.patch \
    file://mainline/ite-it66121/0007-drm-bridge-it66121-Don-t-clear-DDC-FIFO-twice.patch \
    file://mainline/ite-it66121/0008-drm-bridge-it66121-Set-DDC-preamble-only-once-before.patch \
    file://mainline/ite-it66121/0009-drm-bridge-it66121-Move-VID-PID-to-new-it66121_chip_.patch \
    file://mainline/ite-it66121/0010-drm-bridge-it66121-Add-support-for-the-IT6610.patch \
    file://mainline/ite-it66121/0011-drm-bridge-Remove-unnecessary-include-statements-for.patch \
    file://mainline/ite-it66121/0012-drm-Switch-i2c-drivers-back-to-use-.probe.patch \
    file://mainline/ite-it66121/0013-drm-bridge-it66121-Extend-match-support-for-OF-table.patch \
    file://mainline/ite-it66121/0014-drm-bridge-it66121-Simplify-probe.patch \
    file://mainline/ite-it66121/0015-drm-bridge-it66121-Fix-invalid-connector-dereference.patch \
    file://mainline/ite-it66121/0016-drm-bridge-it66121-get_edid-callback-must-not-return.patch \
    file://mainline/ite-it66121/0017-drm-bridge-it66121-switch-to-edid_read-callback.patch \
    file://mainline/ite-it66121/0018-drm-bridge-ite66121-Register-HPD-interrupt-handler-o.patch \
    file://mainline/ite-it66121/0019-drm-bridge-it66121-Remove-a-duplicated-invoke-of-of_.patch \
    file://mainline/ite-it66121/0020-drm-bridge-ite-it66121-Drop-hdmi_avi_infoframe_init-.patch \
    file://mainline/ite-it66121/0021-drm-bridge-ite-it66121-use-eld_mutex-to-protect-acce.patch \
    file://mainline/ite-it66121/0022-drm-Use-of_property_present-for-non-boolean-properti.patch \
    file://drivers/it66121_drm_connector/0001-HACK-drm-bridge-ite-it66121-Add-drm_connector-suppor.patch \
    file://drivers/it66121_drm_connector/0002-HACK-drm-bridge-ite-it66121-Hack-hpd-back-in.patch \
    file://drivers/it66121_drm_connector/0003-fix-it66122-hotplug.patch \
    file://drivers/it66121_drm_connector/0004-ite-it66121-drm_connector-switch-to-edid_read-callba.patch \
    file://drivers/it66122/0001-dt-bindings-display-bridge-it66121-Add-compatible-st.patch \
    file://drivers/it66122/0002-drm-bridge-it66121-Add-it66122-support.patch \
    file://firmware/am335x-bone-scale-data.bin \
    file://firmware/am335x-evm-scale-data.bin \
    file://firmware/am335x-pm-firmware.bin \
    file://firmware/am335x-pm-firmware.elf \
    file://firmware/regulatory.db \
    file://firmware/regulatory.db.p7s \
    file://0001-add-ite-it66122.patch \
    file://defconfig \
"

KERNEL_DEVICETREE += " ti/omap/am335x-boneblack-revd.dtb"
DEVICETREE_FILE += "am335x-boneblack-revd.dtb"

do_configure:append() {
    install -d ${S}/firmware
    install -m 0644 ${WORKDIR}/firmware/am335x-bone-scale-data.bin ${S}/firmware/
    install -m 0644 ${WORKDIR}/firmware/am335x-evm-scale-data.bin ${S}/firmware/
    install -m 0644 ${WORKDIR}/firmware/am335x-pm-firmware.bin ${S}/firmware/
    install -m 0644 ${WORKDIR}/firmware/am335x-pm-firmware.elf ${S}/firmware/
    install -m 0644 ${WORKDIR}/firmware/regulatory.db ${S}/firmware/
    install -m 0644 ${WORKDIR}/firmware/regulatory.db.p7s ${S}/firmware/
}

FILES:${PN} += "${nonarch_base_libdir}/firmware/am335x-bone-scale-data.bin"
FILES:${PN} += "${nonarch_base_libdir}/firmware/am335x-evm-scale-data.bin"
FILES:${PN} += "${nonarch_base_libdir}/firmware/am335x-pm-firmware.bin"
FILES:${PN} += "${nonarch_base_libdir}/firmware/am335x-pm-firmware.elf"
FILES:${PN} += "${nonarch_base_libdir}/firmware/regulatory.db"
FILES:${PN} += "${nonarch_base_libdir}/firmware/regulatory.db.p7s"