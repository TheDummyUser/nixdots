{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "TheDummyUser";
    userEmail = "abhiram.reddy122002@gmail.com";
  };
}
