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

