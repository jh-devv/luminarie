{pkgs, ...}: {
  # Shell
  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;

  # User Accounts Configuration
  users.users.jh-devv = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
  };
}
