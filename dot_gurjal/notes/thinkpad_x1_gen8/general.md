# thinkpad x1 carbon gen 8 notes

## kernel module i2c_i801 doesnt load
    - blacklist i2c_i801
        - not sure if this the right module to blacklist
            - might be 'i2c_smbus'

## no 'zoom' identifier udevd
    - copy '/usr/lib/udev/hwdb.d/60-keyboard.hwdb' to '/etc/udev/hwdb.d/'
    - comment out all references to 'zoom'

## set backlight to max value
    echo $(cat /sys/class/backlight/intel_backlight/max_brightness) > /sys/class/backlight/intel_backlight/brightness

## audio crackling fix
    hda-verb /dev/snd/hwC0D0 0x1d SET_PIN_WIDGET_CONTROL 0x0

## snippet from /etc/acpi/handler.sh for handling laptop hardware events
    launches slock whenever laptop lid close event detected
    ```
    ...
        button/lid)
          case "$3" in
              close)
        DISPLAY=:0 su -c - gurjal slock
                  logger 'LID closed'
                  ;;
              open)
                  logger 'LID opened'
                  ;;
              *)
                  logger "ACPI action undefined: $3"
                  ;;
    ...
    ```
