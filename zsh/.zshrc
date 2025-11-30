# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/kush/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Powerlevel10k configuration
if [[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Start SSH agent and add key automatically
if [ -z "$SSH_AUTH_SOCK" ]; then
	eval "$(ssh-agent -s)" > /dev/null
	ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"
export QT_NO_KEYCHAIN=1
export ROCM_PATH=/opt/rocm
export HIP_PATH=/opt/rocm/hip
export PATH=$PATH:/opt/rocm/bin
export HSA_OVERRIDE_GFX_VERSION=11.0.0
export HCC_AMDGPU_TARGET=gfx1100
export OPENSSL_CONF=/dev/null

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3;3~" kill-whole-line

# Ctrl+Backspace: delete last path segment only
backward-kill-path-segment() {
  local WORDCHARS='*?_-.[]~=&;!#$%^(){}<>@'
  zle backward-kill-word
}
zle -N backward-kill-path-segment
bindkey "^H" backward-kill-path-segment

# Alt+Backspace: delete entire path/word
backward-kill-path() {
  local WORDCHARS='*?_-.[]~=&;!#$%^(){}<>/:@'
  zle backward-kill-word
}
zle -N backward-kill-path
bindkey "^[^?" backward-kill-path

