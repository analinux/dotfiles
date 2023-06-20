# dotfiles

📷 [screens](#--screens)
📝 [info](#--info)
💻 [usage](#--usage) 
[post](#--post)
---

## ↛ 📷 screens

![image]()

![image]()

![image]()

![image]()
---

## ↛ 📝 info

### desktop

```
OS: Arch Linux
Compositor: Hyprland
Bar: Waybar
GTK Theme: Catppuccin Mocha Pink (+ transparent mod (that i fixed))
Icon Theme: Papyrus (Catppuccin folders patch)
Font: FiraCode Nerd Font
Notification Daemon: Mako
Application Launcher: Wofi
```

### terminal

```
Terminal: Wezterm
Shell: Zsh 
Fetch: Neofetch
Prompt: P10K
Editor: Nano 
```

### apps

```
Browser: LibreWolf
File Manager: Thunar
Volume Control: Pavu-control & Easy-Effects
Music Spotify-tui
```

---

## ↛ 💻 usage

> Note: you will need `make` and `yay` installed

clone and enter the repo:

```sh
git clone https://github.com/analinux/dotfiles -b dots-2 && cd dotfiles
```

install packages:
```sh
make deps
```

install dotfiles to system:

```sh
make install
```

transparent gtk mod:

```sh 
make transparent-gtk
```

backup/save configuration from system:

```sh
make save
```

thunar transparency
```mv 
gtk.css /usr/share/themes/Catppuccin-Mocha-Standard-Pink-Dark/gtk-3.0/
```

## post

stolen and based off ozwaldorf with a few touches from me
