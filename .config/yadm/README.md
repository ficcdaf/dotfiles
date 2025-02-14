# Daniel's Dotfiles

My personal Linux dotfiles.

I use Arch btw.

The root of this repo is equivalent to my $HOME directory.

## Note On Keybindings

A note on keybindings: I use Colemak-DH, which is a non-qwerty keyboard layout. I use either `MNEI` or the arrow keys (which is a mod key + `MNEI` on my keyboard) for navigation, depending on a few different factors.

If `MNEI` conflicts with any defaults that would be far too finicky to remap, I just use the arrow keys. Otherwise, I bind `MNEI` to navigation.

### Management

Currently I'm using `yadm` to manage these dotfiles. I have tried some other solutions like `chezmoi` and `stow`, but this one has stuck for me. I highly recommend it. I use [AutoYADM](https://github.com/ficcdaf/autoyadm) to automate committing and pushing my changes.

If you see a file with a weird name, like `config##hostname.dbox`, it's leveraging `yadm`'s alternate files feature; the program will automatically symlink that file to its appropriate destination depending on which computer it's on.
