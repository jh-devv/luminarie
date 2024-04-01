default:
  @echo $(tput bold)"This is your justfile. You can find the nixos/hm commands here! :3$(tput sgr0)"

nixos:
  sudo nixos-rebuild switch --flake .#luminara

home-manager:
  home-manager switch --flake .#jh-devv@luminara
  hyprctl reload

clean:
  sudo nix-collect-garbage -d
  nix-collect-garbage -d

update:
  nix flake update