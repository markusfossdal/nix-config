# Nix-config

## Ubuntu install

- Install the following
```
git
curl
```

- before installing Nix package manager from [www.nixos.com](www.nixos.com)

- edit `/etc/nix/nix.conf` to include 
```
experimental-features = nix-command flakes
```
- Move or delete `~/.bashrc` and `~/.profile`

- Run by using eiter

```
nix run .#homeConfigurations.$USER@$HOST.activationPackage
```

or by installing standalone home-manager (recommended) from the official [github](https://github.com/nix-community/home-manager) repo.

to switch

```
home-manager switch
```
### Software not managed by home-manager
```
alacritty
1password
google-chrome
ros2
gazebo
matlab
```
