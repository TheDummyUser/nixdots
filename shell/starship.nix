{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.starship;
    settings = {
      add_newline = false;
      palette = "dynamic";
      format = lib.concatStrings [
        "$os$username$hostname$rust$python$node$lua$git_branch$git_status$git_state$fill$nix_shell$time$line_break$directory$sudo$character"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "[ ](blue)";
        error_symbol = "[ ](red)";
      };
      fill = { symbol = " "; };
      time = {
        disabled = false;
        format = "[ 󰅐 $time ]($style)";
        time_format = "%T";
        style = "fg:magenta  bg:dark-gray";
      };
      username = {
        disabled = false;
        style_user = "fg:bg bg:blue bold";
        style_root = "fg:red bg:blue  italic";
        format = "[ $user ]($style)";
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "󰣀 ";
        format = "[ $hostname ]($style)";
        style = " fg:bg bg:dark-cyan bold";
        disabled = false;
      };
      memory_usage = {
        disabled = false;
        threshold = -1;
        symbol = " 󰍛 ";
        format = "[$symbol]($style)[$ram( | $swap) ]($style)";
        style = " fg:bg bg:green";
      };
      directory = {
        read_only = " ";
        home_symbol = " ~";
        truncation_length = 4;
        truncation_symbol = "…/";
        truncate_to_repo = true;
      };
      rust = {
        symbol = "🦀";
        format = "[ $symbol $version ](bg:yellow fg:bg )";
      };
      python = { format = "[ $symbol $version ](bg:yellow fg:bg )"; };
      c = {
        symbol = " ";
        detect_extensions = ''["c", "h", "cpp"]'';
      };
      lua = {
        symbol = "";
        format = "[ $symbol $version ](bg:blue fg:bg)";
      };
      os = {
        disabled = false;
        style = "bg:blue";
        symbols = {
          Arch = "[  ](fg:bg $style)";
          NixOS = "[  ](fg:bg $style)";
          Macos = "[  ](fg:red $style)";
          Linux = "[  ](fg:fg $style)";
        };
      };
      nix_shell = {
        disabled = false;
        symbol = "";
        format = "[ $symbol $state ](bg:blue fg:bg bold)";
      };
      cmd_duration = {
        min_time = 500;
        format = "[ $duration ](fg:yellow bg:dark-gray)";
      };
      git_branch = {
        format = "[ $symbol$branch(:$remote_branch) ](bg:purple fg:bg )";
        symbol = " ";
      };
      git_status = {
        format = "([$all_status ](bg:purple fg:bg ))";
        stashed = " 󰿺";
        modified = " 󱞁";
        untracked = " 󱙓";
        deleted = " 󱙑";
        renamed = " 󱙓";
        staged = " +($count)";
      };
    };
  };
}
