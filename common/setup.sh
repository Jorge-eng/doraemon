#!/bin/sh
set -e
mkbindir(){
    if [ ! -d "$WORKDIR" ]; then
        mkdir "$WORKDIR" && echo "Created $WORKDIR"
    fi
}
mkregdir(){
    if [ ! -d "$REGISTRATIONROOT" ]; then
        git clone git@github.com:hello/masamune.git $REGISTRATIONROOT
    fi
    if [ ! -d "$REGISTRATIONDIR" ]; then
        mkdir "$REGISTRATIONDIR" && echo "Created $REGISTRATIONDIR"
    fi
}

if [ -f $DEVICE_INFO_IMG ]; then
    echo "Incomplete Operation, please check $DEVICE_INFO_IMG"
    return 1
fi
git submodule init
git submodule update
mkbindir
mkregdir


