#!/bin/sh

export EDITOR="hx"
export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM=wayland
# export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland # Specifies the session type as Wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
exec niri-session
