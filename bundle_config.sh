# Script to bundle all of my configurations for vim, tmux, etc into a zip that I can un-bundle elsewhere

# Folders and files wanted
# .vim, .tmux.conf
zip -r /tmp/config.zip ~/.vim ~/.tmux.conf
