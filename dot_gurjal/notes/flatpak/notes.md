# flatpak

## permissions
    '~/.local/share/flatpak'
        on void, was owned by root
        when it should be owned by $USER

    flatpak apps not using system cursor
        give flatpak readonly permissions to the icons directory

            '''
            flatpak --user override --filesystem=/home/$USER/.icons/:ro
            flatpak --user override --filesystem=/usr/share/icons/:ro
            '''

