$ProfileRoot = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$env:path += ";$ProfileRoot"
Import-Module posh-git
Import-Module oh-my-posh
Import-Module GitHelpers
Set-PoshPrompt -Theme paradox
. (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath $(switch($HOST.UI.RawUI.BackgroundColor.ToString()){'White'{'Set-SolarizedLightColorDefaults.ps1'}'Black'{'Set-SolarizedDarkColorDefaults.ps1'}default{return}}))

function gs 
{
    git status
}
function gf 
{
    git fetch
}
function gm 
{
    git merge
}
function gms 
{
    git merge -S
}
function ga 
{
    git add
}
function gcm 
{
    git commit
}
function gcms 
{
    git commit -S
}
function gco 
{
    git checkout
}
function gd 
{
    git difftool -y 2> /dev/null
}
function gb 
{
    git branch
}
function gh 
{
    git help
}
function gl 
{
    git log --pretty=format:"%C(yellow)%h %ad %Creset%s %C(red)%d %Cgreen[%an] %Creset" --decorate --date=short -10 --graph
}
function glm 
{
    git log --oneline --decorate --graph
}
function gu 
{
    git unstage
}
function fixup 
{
    git rebase -i HEAD~2
}