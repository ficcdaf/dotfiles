# Daniel's Dotfiles

My personal Linux dotfiles.

I use Arch btw.

The root of this repo is equivalent to my $HOME directory.

## Of Interest

### Neovim

Neovim, my beloved.

The best text editor ever made. There's too much going on there to cover here, so I invite you to read my [Neovim config README](./.config/nvim/README.md).

### Shell

I use Zsh. It has some nice features while remaining POSIX compliance, which is important if you like to tinker and end up copying a lot of shell scripts from the internet. I also use `starship` for my prompt because it's wicked fast. I find that the `pure` preset with some minor changes to cwd display is really great for my needs.

### ZelliJ

I used to use tmux but I like ZelliJ simply because it's modal and the keybinds are sensible and more extendable.

### Terminal

Kitty has been the best terminal for me so far. It displays stuff properly, and is as fast as I need it to be.

### i3

I'm using i3 for window management. I have experimented in the past with Hyprland, but I prefer the simplicity of i3.

### Launcher

Rofi is my application launcher of choice. It's easy to configure, minimal, and gets out of the way.

### Process Viewer

`btop` works great when `ps aux | grep` doesn't cut it. It's fast and has a pleasing, intuitive UI. I highly recommend it over both top and htop.

### Notifications

Dunst is all I want from a notification manager.

### Management

Currently I'm using `yadm` to manage these dotfiles. I have tried some other solutions like `chezmoi` and `stow`, but this one has stuck for me. I highly recommend it.

If you see a file with a weird name, like `config##hostname.dbox`, it's leveraging `yadm`'s alternate files feature; the program will automatically symlink that file to its appropriate destination depending on which computer it's on.
