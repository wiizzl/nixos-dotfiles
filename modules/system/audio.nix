{ pkgs, ... }:

{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  services.actkbd = {
    enable = true;

    # bindings = [
    #   # Mute
    #   {
    #     keys = [ 121 ];
    #     events = [ "key" ];
    #     command = "${pkgs.alsa-utils}/bin/amixer -q set Master toggle";
    #   }
    #   # Volume down
    #   {
    #     keys = [ 122 ];
    #     events = [
    #       "key"
    #       "rep"
    #     ];
    #     command = "${pkgs.alsa-utils}/bin/amixer -q set Master 1- unmute";
    #   }
    #   # Volume up
    #   {
    #     keys = [ 123 ];
    #     events = [
    #       "key"
    #       "rep"
    #     ];
    #     command = "${pkgs.alsa-utils}/bin/amixer -q set Master 1+ unmute";
    #   }
    # ];
  };
}
