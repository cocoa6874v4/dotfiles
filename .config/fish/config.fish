if status is-interactive
    fastfetch
    set -g fish_greeting

    # Prompt
    starship init fish | source

    # smarter cd
    zoxide init fish | source
end

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# PATH
fish_add_path ~/.local/bin

# Abbreviations
abbr -a g git
abbr -a ga 'git add'
abbr -a gc 'git commit'
abbr -a gp 'git push'
abbr -a gs 'git status'

abbr -a ll 'eza -la --icons'
abbr -a la 'eza -a --icons'
abbr -a lt 'eza --tree --icons'
