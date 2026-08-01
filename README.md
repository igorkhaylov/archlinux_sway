# archlinux_sway

My **Sway** (Wayland) setup on Arch Linux: window manager config, a hand-written status
bar and the shell config that launches the session. The older X11/i3 setup lives in
[archlinux_config](https://github.com/igorkhaylov/archlinux_config).

![Desktop](.config/sway/images/archlinux_desktop.png)

## Layout

The repository is a `$HOME` overlay — every path is exactly where the file belongs in the
home directory.

| Path | Contents |
| --- | --- |
| `.config/sway/config` | Sway: keybindings, workspaces, outputs, autostart |
| `.config/sway/status.sh` | Status bar: date, uptime, battery, volume, network |
| `.config/sway/wifi_status.sh` | Wi-Fi indicator used by the status bar |
| `.config/sway/images/` | Wallpapers referenced from the config |
| `.config/neofetch/config.conf` | neofetch output |
| `.zshrc` | Prompt, aliases; starts Sway automatically on `tty1` |

## Requirements

```bash
sudo pacman -S sway swaybg swayidle swaylock swaynag \
               foot wofi grim slurp brightnessctl \
               noto-fonts-emoji neofetch
```

`foot` is the terminal, `wofi` the launcher, `grim` + `slurp` take screenshots
(<kbd>Print</kbd> writes them to `~/pictures/grim/`), `brightnessctl` handles the
backlight keys, and the emoji font is what the status bar draws its icons with.

## Applying

```bash
git clone https://github.com/igorkhaylov/archlinux_sway.git
cd archlinux_sway

ln -sf "$PWD/.config/sway"     ~/.config/sway
ln -sf "$PWD/.config/neofetch" ~/.config/neofetch
```

`.zshrc` starts Sway when you log in on `tty1`, so review it before copying:

```bash
cp .zshrc ~/.zshrc
```

Reload a running session with <kbd>Mod</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd>.

> `.config/sway/config` pins output names, resolutions and scaling for my laptop
> (`eDP-1`) and external monitor (`DP-3`). Adjust the `output` lines to your hardware —
> `swaymsg -t get_outputs` prints what you have.
