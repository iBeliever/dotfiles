if command --search powerline >/dev/null
    set python3_root (python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
    #set python3_root (pip3 show powerline-status | grep Location | cut -d':' -f2 | string trim)
    set fish_function_path $fish_function_path "$python3_root/powerline/bindings/fish"
    powerline-setup
    powerline-daemon -q
end

if command --search yarn >/dev/null
    set -x PATH (yarn global bin --offline) $PATH
end

if command --search ruby > /dev/null
    set -x PATH (ruby -e 'print Gem.user_dir')/bin $PATH
end

if test -d ~/.cargo/bin
    set -x PATH $PATH ~/.cargo/bin
end

if test -d ~/.local/bin
    set -x PATH $PATH ~/.local/bin
end

eval (python3 -m virtualfish)

set -x LEDGER_FILE ~/Documents/personal/finances/current.ledger

switch (uname)
case Darwin
    set -x PATH $PATH ~/Library/bin

    alias dock-add-spacer "defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type=\"spacer-tile\";}'; and killall Dock"
    alias show-files 'defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    alias hide-files 'defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
case Linux
    set -x ANSIBLE_ROLES_PATH ~/.local/share/ansible/roles
end
