# meta-it66122 Layer

## Overview

The `meta-it66122` layer enables IT66122 HDMI chip support for the BeagleBone Black in a Yocto build environment. It includes the IT66122 driver, firmware, custom device tree (`am335x-boneblack-ite-hdmi.dtb`), and Xorg configuration for HDMI output using the `tilcdc` driver.

## Usage Instructions

### 1. Add the meta-it66122 Layer

1. **Clone Required Repositories**:

   ```bash
   mkdir -p ~/yocto
   cd ~/yocto
   git clone -b scarthgap git://git.yoctoproject.org/poky
   cd poky
   git clone -b scarthgap git://git.yoctoproject.org/meta-ti
   git clone -b scarthgap git://git.openembedded.org/meta-openembedded
   git clone -b scarthgap git://git.yoctoproject.org/meta-arm
   git clone https://github.com/is-qian/meta-it66122.git
   ```

   *Replace* `<your-repo>` *with the actual repository URL for* `meta-it66122`*.*

2. **Initialize Build Environment**:

   ```bash
   source oe-init-build-env build
   ```

3. **Update bblayers.conf**: Edit `~/yocto/poky/build/conf/bblayers.conf` to include `meta-it66122`:

   ```conf
   BBLAYERS += "${TOPDIR}/../meta-ti/meta-ti-bsp"
   BBLAYERS += "${TOPDIR}/../meta-openembedded/meta-oe"
   BBLAYERS += "${TOPDIR}/../meta-arm/meta-arm"
   BBLAYERS += "${TOPDIR}/../meta-arm/meta-arm-toolchain"
   BBLAYERS += "${TOPDIR}/../meta-it66122"
   ```

4. **Configure local.conf**: Edit `~/yocto/poky/build/conf/local.conf`:

   ```conf
   MACHINE = "beaglebone-yocto"
   DISTRO = "poky"
   PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
   ```

### 2. Compile the Image

1. **Clean Previous Builds**:

   ```bash
   cd ~/yocto/poky/build
   bitbake -c cleanall linux-ti-staging
   ```
2. **Build the Image**:

   ```bash
   bitbake -k core-image-sato
   ```

### 3. Flash the Image

1. **Locate the Image**:

   ```bash
   ls ~/yocto/poky/build/tmp/deploy/images/beaglebone-yocto/core-image-sato-beaglebone-yocto.wic
   ```

2. **Flash to SD Card**: Identify the SD card device (e.g., `/dev/sdX`):

   ```bash
   lsblk
   ```

   Flash the image:

   ```bash
   sudo dd if=tmp/deploy/images/beaglebone-yocto/core-image-sato-beaglebone-yocto.wic of=/dev/sdX bs=4M status=progress
   sync
   ```

   *Replace* `/dev/sdX` *with the correct device name.*

3. **Eject the SD Card**:

   ```bash
   sudo eject /dev/sdX
   ```