# Managing suckless software on Void

If you'd like to manage your suckless software via the XBPS package
manager, you can build suckless packages using
[xbps-src](https://github.com/void-linux/void-packages/blob/master/Manual.md). `xbps-src`
is the program that builds the binary packages available in the Void
package repositories, using the templates in [the void-packages GitHub
repository](https://github.com/void-linux/void-packages). Note that
the void-packages repository doesn't contain software *sources*;
instead, it contains the template files that specify how to *fetch and
extract* sources, and how to build XBPS packages from the extracted
sources.

This guide uses the [conventions of the Void
Handbook](https://docs.voidlinux.org/about/about-this-handbook.html).

## Prepare the environment

Clone the void-packages repository:

```
$ git clone https://github.com/void-linux/void-packages
```

Change to the new `void-packages` directory and bootstrap:

```
$ cd void-packages
$ ./xbps-src binary-bootstrap
```

The above steps only need to be performed once, when first creating the local
repository.

## Configuring

The first time you build a suckless package, you will need to:

1. Download and extract the package:

   ```
   $ ./xbps-src extract <package>
   ```

2. Create a `files` directory in the same directory as the package template:

   ```
   $ mkdir srcpkgs/<package>/files
   ```

3. Create your local `config.h` in that directory:

   ```
   $ cp masterdir/builddir/<package>-<version>/config.def.h srcpkgs/<package>/files/config.h
   ```

Edit `srcpkgs/<package>/files/config.h` as required.

## Building and installing

From the repository root, build the package:

```
$ ./xbps-src pkg <package>
```

The package will be available in `hostdir/binpkgs/suckless/`. Install the
package:

```
# xbps-install -R hostdir/binpkgs <package>
```

## Reconfiguring an installed package

After editing your `config.h`, force-rebuild the package using the `-f` option:

```
$ ./xbps-src -f pkg <package>
```

Then force-reinstall using the `-f` option:

```
# xbps-install -R hostdir/binpkgs -f <package>
```

## Applying patches

Patches for the version being built, as specified in
`srcpkgs/<package>/template`, can be applied by adding them to a
`srcpkgs/<package>/patches` directory.

## Checking for package updates

Update your local `void-packages` repository using `git pull --rebase`, then use
[xbps-checkvers(1)](https://man.voidlinux.org/xbps-checkvers.1) to check if
there's a newer version:

```
$ xbps-checkvers -D <local_repository_path> -I -m <package>
```

More than one package name can be supplied to the `-m` option.

If there's a newer version, start again from [the "Configuring"
step](#configuring), omitting the step of creating a `files`
directory.
