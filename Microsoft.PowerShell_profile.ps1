Set-Location ~

# !Functions
function yta($url) {
    youtube-dl -f bestaudio -x --audio-format mp3 $url
}

function ytpl($url) {
    youtube-dl -f bestaudio -x --audio-format mp3 --yes-playlist $url
}


# !Scripts
. $HOME\Documents\WindowsPowerShell\Scripts\Invoke-jecODSearch.ps1



# !Aliases
Set-Alias ods Invoke-jecODSearch # ?Category options are: audio video, book, image, archive


# !Modules
Import-Module posh-git