{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    options = {
      ### Settings from original zathurarc ###
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      font = "JetbrainsMono Nerd Font 11";

      # Everblush Theme
      # Allow recolor
      recolor = "true";

      # Don't allow original hue when recoloring
      recolor-keephue = "true";

      # Don't keep original image colors while recoloring
      recolor-reverse-video = "false";

      default-fg = "#dadada";
      default-bg = "rgba(20, 27, 30, 0.95)";

      completion-bg = "#141b1e";
      completion-fg = "#dadada";
      completion-highlight-bg = "#141b1e";
      completion-highlight-fg = "#dadada";
      completion-group-bg = "#141b1e";
      completion-group-fg = "#67cbe7";

      statusbar-fg = "#dadada";
      statusbar-bg = "#141b1e";

      notification-bg = "#141b1e";
      notification-fg = "#dadada";
      notification-error-bg = "#141b1e";
      notification-error-fg = "#e57474";
      notification-warning-bg = "#141b1e";
      notification-warning-fg = "#dadada";

      inputbar-fg = "#dadada";
      inputbar-bg = "#141b1e";

      recolor-lightcolor = "rgba(0, 0, 0, 0)";
      recolor-darkcolor = "#dadada";

      index-fg = "#dadada";
      index-bg = "#141b1e";
      index-active-fg = "#dadada";
      index-active-bg = "#141b1e";

      render-loading-bg = "#141b1e";
      render-loading-fg = "#dadada";

      highlight-color = "#2d3437";
      highlight-fg = "#dadada";
      highlight-active-color = "#dadada";
    };
  };
}
