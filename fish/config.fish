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

function gpush
    if test (count $argv) -eq 0
        echo "Usage: gpush <commit message>"
        return 1
    end

    set message (string join " " $argv)

    git add .
    and git commit -m "$message"
    and git push
end

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

function obsidian
    pushd /home/cocoa6874/vault/meme/ > /dev/null
    nvim
    popd > /dev/null
end

if status is-login
	if test (tty) = /dev/tty1
		exec Hyprland
	end
end
