# thinkpad x1 carbon gen 8 void linux notes

## sof-firmware
  - audio doesnt work without this
  - packages
    - sof-firmware

## kernel module i2c_i801 doesnt load
  - blacklist i2c_i801

## no 'zoom' identifier udevd
  - copy '/usr/lib/udev/hwdb.d/60-keyboard.hwdb' to '/etc/udev/hwdb.d/'
  - comment out all references to 'zoom'

## xorg video acceleration
  - packages
    - xorg-minimal
    - mesa-dri
    - mesa-vulkan-intel
    - intel-video-accl

  - select integrated graphics through xorg modesetting

    /usr/share/X11/xorg.conf.d/00-display.conf
    ```
    Section "Device"
      Identifier "Intel Graphics"
      Driver "modesetting"
    EndSection
    ```
