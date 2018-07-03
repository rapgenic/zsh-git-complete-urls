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

    # regex from https://github.com/jonschlinkert/is-git-url
    if [[ "$clipboard" =~ "(?:git|ssh|https?|git@[-\w.]+):(\/\/)?(.*?)(\.git)(\/?|\#[-\d\w._]+?)$" ]]; then
        _wanted remote-clipboard expl 'remote urls' compadd $clipboard
    fi
}

__git_any_repositories () {
    _alternative \
        'local-repositories::__git_local_repositories' \
        'remotes: :__git_remotes' \
        'remote-repositories::__git_remote_repositories' \
        'remote-clipboard::__git_remote_clipboard'
}
