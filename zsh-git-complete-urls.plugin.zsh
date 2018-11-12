# If clippaste function is present, adds to git clone completions
# a git url present in the clipboard

__git_remote_clipboard() {
    local expl

    # Reset options to defaults and enable LOCAL_OPTIONS
    emulate -L zsh

    # Enable PCRE regexs
    setopt RE_MATCH_PCRE

    # If clippaste does not exist or returns an error (missing
    # xclip and xsel) return silently
    local clipboard && clipboard=$(clippaste) || return

    local completions

    while read -r clip; do
        # regex adapted from https://github.com/jonschlinkert/is-git-url
        if [[ "$clip" =~ "(?:git|ssh|https?|git@[-\w.]+):(\/\/)?(\S*?\.git|github.com\S*?)(\/?|\#[-\d\w._]+?)$" ]]; then
            completions+="$clip "
        fi
    done <<< "$clipboard"

    if [[ -n "$completions" ]]; then
        _wanted remote-clipboard expl 'remote urls' compadd -2 -V 1 ${=completions}
    fi
}

__git_any_repositories () {
    _alternative \
        'remote-clipboard::__git_remote_clipboard' \
        'local-repositories::__git_local_repositories' \
        'remotes: :__git_remotes' \
        'remote-repositories::__git_remote_repositories'
}
