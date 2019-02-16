# tmux-fzf

Quickly execute common tmux commands inside fzf.

## Usage

### Tmux key bindings

* prefix + <kbd>f</kbd>: open fzf fuzzy search window

### FZF window key bindings

* <kbd>ctrl</kbd>+<kbd>d</kbd> (supports multi selection): kill all the selected windows
* <kbd>Enter</kbd> (single selection): switch to the selected window
* <kbd>ctrl</kbd>+<kbd>l</kbd> (single or double selection): create link window.
If two entries are selected, the first one will be the source window and the second
one the target.
If only one entry is selected, a new window in the current session will be created
and linked to the selected window.
* <kbd>ctrl</kbd>+<kbd>Alt</kbd>+<kbd>l</kbd> (single selection): create link window.
Use the selected window as source window and current window as target window.

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```tmux
set -g @plugin 'free-easy/tmux-fzf'
```

Hit `prefix + I` to fetch the plugin and source it.

You should now have all `tmux-fzf` key bindings defined.

### Manual Installation

Clone the repo:

```
$ git clone https://github.com/free-easy/tmux-fzf ~/clone/path
```

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/tmux-fzf.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

You should now have all `tmux-fzf` key bindings defined.
