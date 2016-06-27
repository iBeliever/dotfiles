set python3_root ~/.local/lib/python3.5/site-packages

set fish_function_path $fish_function_path "$python3_root/powerline/bindings/fish"
powerline-setup

eval (python -m virtualfish)

# set -x PATH (ruby -e 'print Gem.user_dir')/bin $PATH

set -x PATH $PATH ~/.local/bin
set -x QML2_IMPORT_PATH ~/.local/lib/qt/qml/ $QML2_IMPORT_PATH
