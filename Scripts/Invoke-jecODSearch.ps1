<# powershell script to search google for open directories

 syntax:
 .\jecODSearch -type {search type} -SearchString {search string}
 
 Valid types are:
   - audio
   - video
   - book
   - image
   - archive
 
 This script is offered without warranties.
#>

function Invoke-jecODSearch {

    [CmdletBinding()]
    Param ( 
        [Parameter(Mandatory = $false)]
        [String]$Type = $null,
        [string]$SearchString = $null
    )


    switch ( $Type ) {
        audio { $searchtype = "(.ogg|.mp3|.flac|.wma|.m4a|.alac|.ape|.aac)" }
        video { $searchtype = "(.mkv|.mp4|.avi|.mov|.mpg|.wmv)" }
        book { $searchtype = "(.MOBI|.CBZ|.CBR|.CBC|.CHM|.EPUB|.FB2|.LIT|.LRF|.ODT|.PDF|.PRC|.PDB|.PML|.RB|.RTF|.TCR)" }
        image { $searchtype = "(.jpg|.gif|.png|.tif|.tiff|.psd)" }
        archive { $searchtype = "(.rar|.tar|.zip|.sit)" }
    }

    ## variables
    $google = "https://www.google.com/search?q="
    $delimit = "%20intitle:%22index%20of%22%20-inurl:(jsp|pl|php|html|aspx|htm|cf|shtml)"
    $exclusions = "%20-inurl:(hypem|unknownsecret|sirens|writeups|trimediacentral|articlescentral|listen77|mp3raid|mp3toss|mp3drug|theindexof|index_of|wallywashis|indexofmp3)"
    ##

    # open default browser to search page.
    Start-Process $google+$searchtype+$SearchString+$delimit+$exclusions
}