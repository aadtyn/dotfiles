export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dstufft"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -cA'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'
# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export BUN_INSTALL="$HOME/.bun" PATH="$BUN_INSTALL/bin:$PATH:/Users/soul/Library/Python/3.9/bin:/opt/homebrew/opt/openjdk/bin:/opt/gawk/libexec/gnubin:$HOME/.local/share/solana/install/active_release/bin:/Users/soul/.codeium/windsurf/bin:/Users/soul/.platformio/penv/bin:$GOPATH/bin" CPPFLAGS="-I/opt/homebrew/opt/openjdk/include" && eval "$(zoxide init zsh)" && . "$HOME/.local/bin/env"

# opencode
export PATH=/Users/soul/.opencode/bin:$PATH

# bun completions
[ -s "/Users/soul/.bun/_bun" ] && source "/Users/soul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export VOICENOTES_API_KEY="5e468aff05e2a535160f5334d9cedf9646cd427940aa8b2d65163adc5ca89375"

# OpenClaw Completion
export TICKTICK_CLIENT_ID="U3Q98KeCDfxq1l5y62"
export TICKTICK_CLIENT_SECRET="lAl5q3T1TK54BryPlRZkhKogtYMKDsmP"
export WHOOP_CLIENT_ID="c3a82f98-00d8-4696-864a-07c1fd827f40"
export WHOOP_CLIENT_SECRET="9b9492b25dbe38a54c0e86804527f1d553ede45219f70e45a7e512e0dce43f7a"
export WHOOP_REDIRECT_URI="http://localhost:8400/auth/whoop/callback"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
export SUPERMEMORY_CC_API_KEY="sm_5YGSPiG15AyNZtjyiZev3h_g0W7BNMsCsi6ChCDUT3Z2f0aQmGI5UJ"
