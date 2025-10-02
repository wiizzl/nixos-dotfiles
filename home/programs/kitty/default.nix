{
  programs.kitty = {
    enable = true;

    keybindings = {
      "ctrl+shift+tab" = "new_tab";
      "ctrl+j" = ''kitten pass_keys.py bottom ctrl+j'';
      "ctrl+k" = ''kitten pass_keys.py top    ctrl+k'';
      "ctrl+h" = ''kitten pass_keys.py left   ctrl+h'';
      "ctrl+l" = ''kitten pass_keys.py right  ctrl+l'';
    };
  };
}
