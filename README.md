# config


For Windows:



1. Fonts
    - Install Cascadia Code PL

1. VSCode
    - Keybindings: ctrl+shift+p, search for keyboard to get keybindings.json, replace with contents of vscode.keybindings.json
    - Settings: ctrl+shift+p, search for Settings to open settings.json, replace with contents of vscode.settings.json

1. Powershell/Microsoft Terminal
    - Heavily based on this: https://www.hanselman.com/blog/how-to-make-a-pretty-prompt-in-windows-terminal-with-powerline-nerd-fonts-cascadia-code-wsl-and-ohmyposh
    - Install-Module oh-my-posh -Scope CurrentUser
    - PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
    - Move the .ps1 files to /path/to/Documents/WindowsPowerShell
    - Replace Windows Terminal's settings.json file with windows-terminal.settings.json
    - Install Cascadia Code PL into C:/Windows/Fonts (.tff should work)