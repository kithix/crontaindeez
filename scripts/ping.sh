#!/usr/bin/env bash

if ! command -v ping &> /dev/null; then
    apt-get install -y iputils-ping
fi

ping -c 4 $1