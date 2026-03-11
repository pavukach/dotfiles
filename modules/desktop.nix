{
  inputs,
  ...
}:
{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];
  programs.sway.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.sysc-greet = {
    enable = true;
    compositor = "sway";
    # settings.initial_session = {
    #   command = "niri-session";
    #   user = "maksym";
    # };
  };

}
