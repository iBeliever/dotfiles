set python3_root (pip3 show powerline-status | grep Location | cut -d':' -f2 | string trim)

set fish_function_path $fish_function_path "$python3_root/powerline/bindings/fish"
powerline-setup

eval (python3 -m virtualfish)

# set -x PATH (ruby -e 'print Gem.user_dir')/bin $PATH

switch (uname)
case Darwin
    set -x PATH $PATH ~/Library/bin

    # On Linux, there's a systemd service for this
    powerline-daemon -q
case Linux
    set -x PATH $PATH ~/.local/bin
    set -x QML2_IMPORT_PATH ~/.local/lib/qt/qml/ $QML2_IMPORT_PATH
    set -x ANSIBLE_ROLES_PATH ~/.local/share/ansible/roles
end
