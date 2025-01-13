#!/bin/sh

# export XDG_CURRENT_DESKTOP=sway # Sets the desktop environment to Sway
# export XDG_SESSION_DESKTOP=sway # Specifies the session desktop
# export WAYLAND_DISPLAY=wayland-0      # Specifies the Wayland display socket (default)
# export GDK_BACKEND=wayland,x11        # Ensures GTK apps prefer Wayland but fallback to XWayland
# export QT_QPA_PLATFORM=wayland        # Forces QT apps to use Wayland
# export QT_QPA_PLATFORMTHEME=qt5ct     # For QT theming with Wayland
# export MOZ_ENABLE_WAYLAND=1           # Enables Wayland support for Firefox
# export CLUTTER_BACKEND=wayland        # Enables Wayland support for Clutter-based apps
# export SDL_VIDEODRIVER=wayland        # Enables Wayland support for SDL apps
# export XWAYLAND_NO_GLAMOR=1           # Disable glamor if you have performance issues with XWayland
# export _JAVA_AWT_WM_NONREPARENTING=1  # Fixes Java apps under Wayland
# export WLR_DRM_DEVICES=/dev/dri/card0 # Explicitly set the DRM device
# export WLR_RANDR_SCREENSHOOTING=1     # Enables better screenshot support
export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland # Specifies the session type as Wayland
exec sway
