```ini
[iPutHereForHL]
pipe-scrollback=[fish -c "piped_window_editor"] Shift+Mod1+o
pipe-visible=[fish -c "piped_window_editor"] Shift+Mod1+l
```

```fish
function piped_window_editor
    set -l file /tmp/cami-helix-overlay
    read -z >$file
    footclient -N helix -c ~/r/dot/helix/wrap-off.toml $file
end
```
