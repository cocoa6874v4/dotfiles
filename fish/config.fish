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

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Abbreviations
abbr -a g git
abbr -a ga 'git add'
abbr -a gc 'git commit'
abbr -a gp 'git push'
abbr -a gs 'git status'

abbr -a ll 'eza -la --icons'
abbr -a la 'eza -a --icons'
abbr -a lt 'eza --tree --icons'

# Dotfiles
function dots
    git -C ~/.config add -A
    git -C ~/.config commit -m (string join ' ' $argv)
    git -C ~/.config push
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

if status is-login
	if test (tty) = /dev/tty1
		exec Hyprland
	end
end
