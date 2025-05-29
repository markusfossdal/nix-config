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

### Software not managed by home-manager
```
alacritty
dropbox
1password
google-chrome
ros2
gazebo
matlab
docker
```
