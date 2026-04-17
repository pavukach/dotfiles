{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Maksym Diachok";
      user.email = "maksdyachok2005@gmail.com";
      push.default = "current";
      branch.autoSetupMerge = "always";
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
      ".qwen/"
      "shell.nix"
      ".envrc"
      ".direnv/"
    ];
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers = [
        {
          pager = ''
            delta --dark --paging=never \
                      --line-numbers --hyperlinks \
                      --hyperlinks-file-link-format="lazygit-edit://{path}:{line}"'';
        }
      ];
    };
  };

  home.packages = with pkgs; [
    delta
  ];
}
