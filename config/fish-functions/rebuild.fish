function rebuild
    if not test -n $NIX_DIR
        echo "NIX_DIR is not set"
        return 1
    end
    if not test -d $NIX_DIR
        echo "$NIX_DIR is not a directory"
        return 1
    end

    argparse u t -- $argv

    sudo -v
    pushd $NIX_DIR
    git add .

    nix-shell https://github.com/vic/flake-file/archive/main.tar.gz -A flake-file.sh --run bootstrap
    if set -q _flag_u
        nix flake update
    end

    set rebuild_args
    if set -q _flag_t
        set rebuild_args --show-trace
    end
    nh os switch . --impure $rebuild_args

    popd
end
