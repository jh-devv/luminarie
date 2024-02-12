{pkgs, ...}: {
  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;

  users.users.jh-devv = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
  };
}
