#!/usr/bin/env bash

package=$1
pkg_installed=false
pkg_updated=false
verbose=true

# TODO: ensure valid input

brew update >/dev/null 2>&1
list_output=`brew cask list | grep $package`
outdated_output=`brew cask outdated | grep $package`

# now enable error checking
set -e

if [[ ! -z "$list_output" ]]; then
    pkg_installed=true
    $verbose && echo "package is installed"
    if [[ -z "$outdated_output" ]]; then
        pkg_updated=true
        $verbose && echo "package is updated"
    else
        $verbose && echo "package is not updated. updating..."
        brew cask upgrade $package
    fi
else
    $verbose && echo "package is not installed. installing..."
    brew cask install $package
fi