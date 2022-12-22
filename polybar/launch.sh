#!/usr/bin/env bash

polybar-msg cmd quit

polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bar launched"
