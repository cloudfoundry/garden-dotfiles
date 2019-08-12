# garden-workstations

## First-time usage

1. Change the workstation password.
1. Clone this repo.
1. macOS only: uninstall shiftit, iterm, any other cask apps listed in the casks of macos.yml.
1. macOS only: sign into app store and update xcode. Then, open xcode and accept the license. Then run `xcode-select --install`. You'll need to do this for some inexplicable reason to use the C compiler. Remind me again why macOS is so developer-friendly?
1. Ensure your SSH key is loaded via `ssh-add -l`
1. `<garden-workstations>/run.sh`

## Currently-required manual steps

1. If `bosh-cli` brew package was already installed **without** the
   `without-bosh2` option, run `brew uninstall --force bosh-cli`. This is
   needed as brew will falsely claim success, but won't change the link name
   from bosh2 to bosh.
1. If migrating from recent (pre 03/08/2017) revisions on the `ansible` branch:
   `git checkout master && git fetch && git reset --hard origin/master`.  This
   is necessary because master was force pushed to the old ansible branch.

## Linux post-install

1. Do the things in common post-install below.

## macOS post-install

1. Open flycut, shifit. Ensure they start on startup.
1. Open Keyboard preferences > Shortcuts > Input Sources > untick "Select the previous input source" (or whatever is stealing ctrl+space from our tmux config). This start off unticked anyway, but will become ticked as soon as you add another input source (e.g. US layout)!
1. Hide the dock.
1. Speed up key repeat.
1. Make iTerm append Esc to Alt key. Open iTerm -> Preferences -> Profiles -> Keys and change the Left and Right Alt key settings from Normal to Esc+. This restores alt+f, alt+backspace etc.
1. Do the things in common post-install below.

## Common post-install

1. Reload tmux and shell.
1. Install TPM plugins (in tmux press prefix+I).
1. `ruby-install` yourself a Ruby version.
1. `vim-update`. Not all plugins install unless the shell is interactive, for some reason.
1. Enable `bash-it` plugins and completions. This used to be automated, but they have since merged a change which means [bash-it cannot be run interactively](https://github.com/Bash-it/bash-it/pull/1325/commits/83c44fac646ef92e70694f1528d63a6f66b99cfd). Until we find another way around this, run:
   ```sh
   source ~/.bash_profile
   bash-it enable plugin base chruby-auto chruby fzf git
   bash-it enable completion bash-it git system
   ```

## TODO

1. git autocomplete in bash
1. Unify tmux configs? It looks like that TPM plugin is cross-platform.
1. tmate config that works.
1. tmate on linux
1. automate installation of Ruby in run.sh based on `.ruby-version`.
1. macOS key repeat (this is a bit of a pain to automate as valid defaults vales changed between el capitan and sierra. Might not even be worth automating)
1. rethink PS1 (do we need that watch emoji and ruby version?)

# Troubleshooting

* Can't find cask

	```
	failed: [localhost] (item=docker) => {"failed": true, "item": "docker", "msg": "Error: Cask 'gitx-rowanj' is unavailable: No Cask with this name exists."}
	```
	
	Similar errors to this probably means your homebrew has a cask that is no longer available. In this case, make sure you don't
	have gitx installed, and manually remove its cask folder from `/usr/local/Caskroom`.
