# Wezterm Config

Refer to [the official doc]( https://wezfurlong.org/wezterm/config/files.html ).

Also, refer to the following post:

- https://www.sharpwriting.net/project/configuring-wezterm/

## My Config

Save the following to `~/.config/wezterm/wezterm.lua`:

<details>
<summary>content</summary>

```lua
local wezterm = require 'wezterm'

return {
  initial_cols = 128,
  initial_rows = 32,

  enable_scroll_bar = true,

  window_background_opacity = .75,

  -- alternatives: 'Cascadia Code'
  font = wezterm.font('MesloLGS Nerd Font'),
  font_size = 11,

  colors = {
    -- The default text color
    foreground = '#FFFFFF',
    -- The default background color
    background = '#000000',

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = '#FFA31A',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = '#000000',
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = '#52AD70',

    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names
    -- "Black", "Maroon", "Green", "Olive", "Navy", "Purple", "Teal", "Silver",
    -- "Grey", "Red", "Lime", "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    ansi = { '#000000', '#CD3131', '#4E9A06', '#FFCC00', '#01A0E4', '#9F00FF', '#80CBC4', '#E5E5E5', },
    brights = { '#707880', '#F14C4C', '#A6E22E', '#FDED02', '#89DDFF', '#CF8DFB', '#A1EFE4', '#FFFFFF', },
  },
}
```

</details>

## Default Keybinding

Refer to [the official doc](https://wezfurlong.org/wezterm/config/default-keys.html).
