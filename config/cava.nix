{ pkgs, config, ... }: {
  home.packages = [ pkgs.cava ];
  custom.wallust.entries.cava = {
    enable = builtins.elem pkgs.cava config.home.packages;
    text = ''
      ## Configuration file for CAVA. Default values are commented out. Use either ';' or '#' for commenting.

      [general]

      # Smoothing mode. Can be 'normal', 'scientific' or 'waves'.
      mode = normal

      # Accepts only non-negative values.
      framerate = 60

      # 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
      # 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens.
      ; autosens = 1
      ; overshoot = 20

      # Manual sensitivity in %. Autosens must be turned off for this to take effect.
      # 200 means double height. Accepts only non-negative values.
      ; sensitivity = 100

      # The number of bars (0-200). 0 sets it to auto (fill up console).
      # Bars' width and space between bars in number of characters.
      bars = 0
      bar_width = 4
      bar_spacing = 1

      # Lower and higher cutoff frequencies for lowest and highest bars
      # the bandwidth of the visualizer.
      # Note: there is a minimum total bandwidth of 43Mhz x number of bars.
      # Cava will automatically increase the higher cutoff if a too low band is specified.
      ; lower_cutoff_freq = 50
      ; higher_cutoff_freq = 10000

      [input]

      # Audio capturing method. Possible methods are: 'pulse', 'alsa' or 'fifo'.
      # Defaults to 'pulse', 'alsa' or 'fifo', in that order, dependent on what support cava was built with.
      #
      # All input methods uses the same config variable 'source'
      # to define where it should get the audio.
      #
      # For pulseaudio 'source' will be the source. Default: 'auto', which uses the monitor source of the default sink
      # (all pulseaudio sinks(outputs) have 'monitor' sources(inputs) associated with them).
      #
      # For alsa 'source' will be the capture device.
      # For fifo 'source' will be the path to fifo-file.
      method = pulse
      source = auto

      ; method = alsa
      ; source = hw:Loopback,1

      ; method = fifo
      ; source = /tmp/mpd.fifo

      ; bit_format = 16bit

      # Ascii max value. In 'ascii' mode range will run from 0 to value specified here
      ; ascii_max_range = 1000

      # Ascii delimiters. In ascii format each bar and frame is separated by a delimiters.
      # Use decimal value in ascii table (i.e. 59 = ';' and 10 = '\n' (line feed)).
      ; bar_delimiter = 59
      ; frame_delimiter = 10

      # [color]

      # Colors can be one of seven predefined: black, blue, cyan, green, magenta, red, white, yellow.
      # Or defined by hex code '#xxxxxx' (hex code must be within $''''). User defined colors requires a
      # terminal that can change color definitions such as Gnome-terminal or rxvt.
      ; background = black
      ; foreground = cyan

      # Gradient mode, only hex defined colors are supported, background must also be defined in hex
      # or remain commented out. 1 = on, 0 = off. Warning: for certain terminal emulators cava will
      # not able to restore color definitions on exit, simply restart your terminal to restore colors.
      # gradient = 1
      # gradient_color_1 = '#0099ff'
      # gradient_color_2 = '#ff3399'

      [smoothing]

      # Multiplier for the integral smoothing calculations. Takes values from 0-0.99.
      # Higher values means smoother, but less precise. Set to 0 to disable.
      ; integral = 0.7

      # Disables or enables the so-called "Monstercat smoothing". Set to 0 to disable.
      ; monstercat = 1
      ; waves = 1

      # Set gravity multiplier for "drop off". Higher values means bars will drop faster.
      # Accepts only non-negative values. 0.5 means half gravity, 2 means double. Set to 0 to disable "drop off".
      ; gravity = 1


      # In bar height, bars that would have been lower that this will not be drawn.
      ; ignore = 0

      [eq]

      # This one is tricky. You can have as much keys as you want.
      # Remember to uncomment more then one key! More keys = more precision.
      # Look at readme.md on github for further explanations and examples.
      ; 1 = 1 # bass
      ; 2 = 1
      ; 3 = 1 # midtone
      ; 4 = 1
      ; 5 = 1 # treble

      [color]

      # background = '#191724'
      gradient = 1
      gradient_count = 6
      gradient_color_1 = '{color3}'
      gradient_color_2 = '{color4}'
      gradient_color_3 = '{color5}'
      gradient_color_4 = '{color1}'
      gradient_color_5 = '{color2}'
      gradient_color_6 = '{color7}'
    '';
    target = "~/.config/cava/config";
  };
}
