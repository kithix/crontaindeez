#!/usr/bin/env bash

cat /dev/stdin > /proc/$(cat /var/run/crond.pid)/fd/1 2>&1
