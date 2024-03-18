default:
  @echo $(tput bold)"This is your justfile. You can find the nixos/hm commands here! :3$(tput sgr0)"

nixos:
  sudo nixos-rebuild switch --flake .#luminara

home-manager:
  home-manager switch --flake .#jh-devv@luminara -b backup
  hyprctl reload

clean:
  sudo nix-collect-garbage

update:
  nix flake update