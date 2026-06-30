{ ... }:
let
  mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

  mkExtensionEntry =
    {
      id,
      pinned ? false,
    }:
    let
      base = {
        install_url = mkPluginUrl id;
        installation_mode = "force_installed";
      };
    in
    if pinned then base // { default_area = "navbar"; } else base;

  mkExtensionSettings = builtins.mapAttrs (
    _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
  );
in
{
  hm.programs.zen-browser = {

    policies = {
      ExtensionSettings = mkExtensionSettings {
        "uBlock0@raymondhill.net" = mkExtensionEntry {
          id = "ublock-origin";
          pinned = true;
        };
        "addon@darkreader.org" = mkExtensionEntry {
          id = "darkreader";
          pinned = true;
        };
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = mkExtensionEntry {
          id = "proton-pass";
          pinned = true;
        };
        "{91aa3897-2634-4a8a-9092-279db23a7689}" = mkExtensionEntry {
          id = "zen-internet";
          pinned = true;
        };
        "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" = "traduzir-paginas-web";
        "harper@writewithharper.com" = "private-grammar-checker-harper";
        "{a8332c60-5b6d-41ee-bfc8-e9bb331d34ad}" = "surfingkeys_ff";
        "{b9edf38a-e293-4606-a088-e63cd4e56d2d}" = "modern-for-hacker-news";
      };
    };
    profiles.default = {
      sine = {
        enable = true;
        mods = [
          # "Nebula"
        ];
      };
    };

  };
}
