# luminara

Hey! This is my flake for my NixOS setup `Luminara` ( ˶ˆ꒳ˆ˵ )

Managed with Nix (NixOS) and Home Manager! :3

📷 [screens](#--screens)
📝 [info](#--info)
💻 [usage](#--usage)

---

## ↛ 📷 screens

![Screenshot Showcase](assets/showcase.png)

---

## ↛ 📝 info

### desktop

```text
OS: NixOS
Compositor: Hyprland
Bar: Waybar
GTK Theme: Catppuccin GTK
Icon Theme: Catppuccin Folders and Papyrus
Font: Fira Code/JetBrains Mono Nerd Font
```

### terminal

```text
Terminal: Kitty
Shell: Zsh
Fetch: Nitch
Prompt: Starship
Editor: Neovim
```

### apps

```text
Browser: Firefox
File Manager: Nautlilus
```

---

## ↛ 💻 usage

before you use them, are you sure you are familiar with nix? ^w^

first, be sure to edit `hosts/<host>` and edit the `flake.nix`, do the same with home manager `users/<user>`

for nixos:

```bash
just nixos
```

for home manager:

```bash
just home-manager
```

## License

[AGPL-3 License](LICENSE) © [jh-devv](https://jh-devv.com)
