{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Maksym Diachok"; 
      user.email = "maksdyachok2005@gmail.com";
      push.default = "current";
      color.ui = "auto";
      core.editor = "vim";
      pull.rebase = "true";
      init.defaultBranch = "main";
      advice.defaultBranchName = false;
    };
    ignores = [
      ".geminiignore"
      "GEMINI.md"
      ".qwenignore"
      "shell.nix"
      ".envrc"
    ];
  };
}
