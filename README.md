## nvim config
```
require("nvimtmuxnav").setup({
  keybindings = {
    left = "<C-e>h",
    down = "<C-e>j",
    up = "<C-e>k",
    right = "<C-e>l",
  }
})
```


## tmux config
```
# Select tmux pane or vim buffer (Alt-h,j,k,l)
%if "$VIM_TMUX_NAV"
  is_vim='#{m/ri:^(vim?|view|vimdiff|nvim)$,#{pane_current_command}}'
  bind-key -n M-h if-shell -F "$is_vim" { send-keys C-e h } { select-pane -L }
  bind-key -n M-j if-shell -F "$is_vim" { send-keys C-e j } { select-pane -D }
  bind-key -n M-k if-shell -F "$is_vim" { send-keys C-e k } { select-pane -U }
  bind-key -n M-l if-shell -F "$is_vim" { send-keys C-e l } { select-pane -R }
%else
  bind-key -n M-h select-pane -L
  bind-key -n M-j select-pane -D
  bind-key -n M-k select-pane -U
  bind-key -n M-l select-pane -R
%endif
```
