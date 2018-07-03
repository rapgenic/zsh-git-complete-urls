# zsh-git-complete-urls
Zsh plugin to enhance git completion to include in the remotes completion (e.g. from `git clone`) any URL in the clipboard

## Installation

Just source `zsh-git-complete-urls.plugin.zsh` in your `.zshrc`.

> The clipboard plugin (included for example in [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) or available at [zsh-clipboard](https://github.com/twang817/zsh-clipboard) as a single plugin) must be installed for zsh-git-complete-urls to work

Add the following line to your `.zshrc`:

### zplug

```console
zplug "rapgenic/zsh-git-complete-urls"
```

### antigen

```console
antigen bundle rapgenic/zsh-git-complete-urls
```

### antibody

```console
antibody bundle rapgenic/zsh-git-complete-urls
```

### zgen

```console
zgen load rapgenic/zsh-git-complete-urls
```

## How does it work??

It just overrides one of the simplest functions in the default git zsh completion library, `__git_any_repositories`, which gives the suggestions for the repos, and by adding a single argument to the `_alternative` function:

```console
'remote-clipboard::__git_remote_clipboard'
```

where `__git_remote_clipboard` is another function defined in the plugin file that gives back an url suggestion from the clipboard, that is then added to the list of suggestions returned.