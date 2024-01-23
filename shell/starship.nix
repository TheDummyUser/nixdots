{ config, lib, pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$shell$all";

      character = {
        success_symbol = "[󱙝](bold #FFA066)";
        error_symbol = "[󱙜](bold red)";
        vicmd_symbol = "[󰧵](bold #ffb6c1)";
      };

      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";

      directory = {
        read_only = " ";
        format = "in [$path]($style)[$read_only]($read_only_style) ";
        style = "bold #C34043";
        truncation_symbol = "../";
        home_symbol = " ~";
      };

      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      git_branch.symbol = " ";
      git_branch.style = "#FFA066";
      golang.symbol = " ";
      haskell.symbol = " ";
      hg_branch = {
        symbol = " ";
        disabled = true;
      };
      java.symbol = " ";
      julia.symbol = " ";
      memory_usage.symbol = " ";
      nim.symbol = " ";
      nix_shell = {
        symbol = " ";
        impure_msg = "impure";
        pure_msg = "pure";
        format = "via [$symbol$state $name](bold #0f4b6e) ";
      };
      perl.symbol = " ";
      php.symbol = " ";
      python = {
        symbol = " ";
        python_binary = [ "py" "python3" "python2.7" ];
      };

      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      swift.symbol = "ﯣ ";
      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold #FFA066) ";
        disabled = false;
      };

      shell = {
        fish_indicator = "Fish";
        bash_indicator = "Bash";
        zsh_indicator = "Zsh";
        ion_indicator = "Ion";
        elvish_indicator = "Elvish";
        tcsh_indicator = "Tcsh";
        xonsh_indicator = "Xonsh";
        nu_indicator = "Nu Shell";
        powershell_indicator = "PowerShell";
        unknown_indicator = "Unknown shell";
        format = "[󰮯 ]($style)";
        style = "#FFA066 bold";
        disabled = false;
      };

      username = {
        style_user = "#C0A36E	bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      cmd_duration = { format = "took [$duration](bold #C34043) "; };
    };
  };
}
