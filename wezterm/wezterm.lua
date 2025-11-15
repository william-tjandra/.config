local wezterm = require 'wezterm'
local act = wezterm.action

return {
  font = wezterm.font("MesloLGS Nerd Font"),
  font_size = 12.0,
  color_scheme = 'Dracula (Official)',

  enable_tab_bar = false,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  
  keys = {
    -- [1] Word-by-word (Caps Lock + Arrow -> OS sees CMD + Arrow)
    {
      key = 'LeftArrow',
      mods = 'ALT',
      action = act.Multiple {
        act.SendString('\x1bb'), -- ESC b (word backward)
        act.DisableDefaultAssignment,
      },
    },
    {
      key = 'RightArrow',
      mods = 'ALT',
      action = act.Multiple {
        act.SendString('\x1bf'), -- ESC f (word forward)
        act.DisableDefaultAssignment,
      },
    },

    -- [2] Start/End-of-line (Physical Command + Arrow -> OS sees ALT + Arrow)
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = act.Multiple {
        act.SendString('\x01'), -- Ctrl+A (start of line)
        act.DisableDefaultAssignment,
      },
    },
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = act.Multiple {
        act.SendString('\x05'), -- Ctrl+E (end of line)
        act.DisableDefaultAssignment,
      },
    },
  },
}