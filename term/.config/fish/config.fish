if test (uname) = "Linux"
    source /usr/share/cachyos-fish-config/cachyos-config.fish
    alias clear="clear && fastfetch"
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias ls='eza -al --color=always --group-directories-first --icons'
alias vi="vim"
set -x YDOTOOL_SOCKET $HOME/.ydotool_socket

