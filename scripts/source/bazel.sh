if [[ -d "$HOME/.bazel" ]]; then
    export PATH=$PATH:$HOME/bin
    source $HOME/.bazel/bin/bazel-complete.bash
fi
