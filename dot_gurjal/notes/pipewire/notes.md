# pipewire
    /etc/dbus-1/system.d/connman-dbus.conf
    /etc/dbus-1/system.d/connman-polkit.conf

## pipewire autostarting pipewire-media-session
    void

    Copy the initial config to the alternate location :
        sudo mkdir -p /etc/pipewire
        sudo cp /usr/share/pipewire/pipewire.conf /etc/pipewire/

    - then in 'context.exec' section

    - comment out
        ```
        { path = "/usr/bin/pipewire-media-session" args = "" }'
        ```
    -- add
        ```
        { path = "/usr/bin/wireplumber" args = "" }
        { path = "/usr/bin/pipewire" args = "-c pipewire-pulse.conf" }
        ```

## pipewire-alsa

    Run these commands for ALSA integration :
        sudo mkdir -p /etc/alsa/conf.d
        sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
        sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
