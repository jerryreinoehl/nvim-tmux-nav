# Nvim-Tmux Nav

Navigate through tmux panes and nvim windows with the same keybindings.


## Configuration


### Tmux

tmux needs to be configured to detect if nvim is running and, if so, send keys
to nvim allowing it to handle switching windows.

Add the following to your tmux config at `~/.config/tmux/tmux.conf` or
`~/.tmux.conf`, adjusting the keybindings to your liking.

```tmux
is_vim='#{m/ri:^(vim?|view|vimdiff|nvim)$,#{pane_current_command}}'
bind-key -n M-h if-shell -F "$is_vim" { send-keys M-h } { select-pane -L }
bind-key -n M-j if-shell -F "$is_vim" { send-keys M-j } { select-pane -D }
bind-key -n M-k if-shell -F "$is_vim" { send-keys M-k } { select-pane -U }
bind-key -n M-l if-shell -F "$is_vim" { send-keys M-l } { select-pane -R }
```

To turn these bindings on or off with an environment variable, such as
`VIM_TMUX_NAV`, use the following instead.

```tmux
%if "$VIM_TMUX_NAV"
  is_vim='#{m/ri:^(vim?|view|vimdiff|nvim)$,#{pane_current_command}}'
  bind-key -n M-h if-shell -F "$is_vim" { send-keys M-h } { select-pane -L }
  bind-key -n M-j if-shell -F "$is_vim" { send-keys M-j } { select-pane -D }
  bind-key -n M-k if-shell -F "$is_vim" { send-keys M-k } { select-pane -U }
  bind-key -n M-l if-shell -F "$is_vim" { send-keys M-l } { select-pane -R }
%else
  bind-key -n M-h select-pane -L
  bind-key -n M-j select-pane -D
  bind-key -n M-k select-pane -U
  bind-key -n M-l select-pane -R
%endif
```


### Nvim

Add the following to your nvim config file at `~/.config/nvim/init.lua`. The
keybindings here should match those set in your tmux config.

```lua
require("nvimtmuxnav").setup {
  keybindings = {
    left = "<M-h>",
    down = "<M-j>",
    up = "<M-k>",
    right = "<M-l>",
  }
}
```
