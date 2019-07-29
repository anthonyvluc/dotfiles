#!/usr/bin/env bash

ask() {
    read -r -p "$1 [y|N] " response

    if [[ $response =~ (yes|y|Y) ]]; then
        return 0
    else
        return 1
    fi
}

