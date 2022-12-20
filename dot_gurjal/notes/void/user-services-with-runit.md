# User services with runit on Void Linux

  Jon Atkinson <http://www.jonatkinson.co.uk/>

  * Home <http://www.jonatkinson.co.uk/>
  * About <http://www.jonatkinson.co.uk/about/>
  * Feed <https://www.jonatkinson.co.uk/index.xml>

November 23, 2019

Void Linux uses the very miminalist service management tool runit. The
runsvdir program monitors a folder for service definitions, and then
supervises the processes described within. There is a system-wide
instance of runsvdir for system services by default on Void, which is
responsible for your ttys, sshd, maybe a logger, depending on your
configuration.

There will be times when you want to run a service, or a set of
services, as a user, rather than as root, and to do this you can use
nested runsvdir.

Throughout these examples, replace ‘voiduser’ with your own username.

First, will define a system-wide service for running an instance of
runsvdir for the user. This will find it’s set of services in the
folder $HOME/service:

    ```sh
    $ sudo mkdir -p /etc/sv/voiduser
    $ sudo touch /etc/sv/voiduser/run
    $ sudo chmod +x /etc/sv/voiduser/run
    ```

Add the following to /etc/sv/voiduser/run:

    ```sh
    #!/bin/sh

    UID=$(pwd -P)
    UID=${UID##*/}

    if [ -d "/home/${UID}/service" ]; then
     chpst -u"${UID}" runsvdir /home/${UID}/service
    fi
    ```

Now, start this service:

    ```sh
    $ sudo ln -s /etc/sv/voiduser /var/service
    ```

Now, we create a service file for the user. In this example, it’ll run
syncthing, but you can adapt this for any given service:

    ```sh
    $ mkdir -p $HOME/service/syncthing
    $ touch $HOME/service/syncthing/run
    $ chmod +x $HOME/service/syncthing/run
    ```

Then the contents of the run file:

    ```sh
    #!/bin/sh

    export HOME=/home/jonathan/
    exec 2>&1
    exec /usr/bin/syncthing
    ```

That’s it. Now, your system-wide runit will start your user-level
runit, and it’ll run the service. You can check your process tree and
see syncthing running as your own user.
