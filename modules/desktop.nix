{
  inputs,
  ...
}:
{
  imports = [
    inputs.sysc-greet.nixosModules.default
  ];
  programs.sway.enable = true;

  services.sysc-greet = {
    enable = true;
    compositor = "sway";
  };

}
