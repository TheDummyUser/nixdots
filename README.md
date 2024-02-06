
use this following steps to clone my pc

`git clone https://github.com/TheDummyUser/nixdots.git`

sudo nano /etc/nixos/configuration.nix
### Add this line into configuration.nix
`nix.settings.experimental-features = [ "nix-command" "flakes" ];`

rebuild system

`sudo nixos-rebuild switch`

```
cd ~/nixdots

rm configuration.nix hardware-configuration.nix flake.lock

cp /etc/nixos/* ~/nixdots
```

#### Open flake.nix in your text editor and change line 19 as: `let user = "your_user_name";`

1) and use the command in ~/nixdots
2) `sudo nixos-rebuild switch --flake .#default`

### To update the system, use:
##### cd into flake dir:

`nix flake update`