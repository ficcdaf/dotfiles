#!/bin/sh

export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
sway
