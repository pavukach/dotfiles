{ pkgs, ... }:
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

      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      diff.tool = "codediff";
      merge.tool = "codediff";
      mergetool.codediff.cmd = ''nvim "$MERGED" -c "CodeDiff merge \"$MERGED\""'';
      difftool.codediff.cmd = ''nvim "$LOCAL" "$REMOTE" +"CodeDiff file $LOCAL $REMOTE"'';
    };
    ignores = [
      ".geminiignore"
      "GEMINI.md"
      ".qwenignore"
      "shell.nix"
      ".envrc"
      ".direnv"
    ];
  };

  home.packages = with pkgs; [
    delta
  ];
}
