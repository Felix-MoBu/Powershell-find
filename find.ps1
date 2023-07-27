function find {
    Param(
        [Parameter(Mandatory)]
        [string]$Search,

        [Parameter(HelpMessage="Don't include subdirectorys")]
        [switch]$NoRecurse = $false,

        [Parameter(HelpMessage="Interprets the search term as regular expression")]
        [switch]$UseRegEx = $false,

        [Parameter(HelpMessage="Definde filet type filters here")]
        [string]$Filter = "*.*"
        )

    if ($UseRegEx) {
        $escapedSearch = $Search
    } else{
        $escapedSearch = [Regex]::Escape($Search)
    }
    
    if ($NoRecurse) {
        Get-Childitem -filter $Filter | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object Path -Unique
    } else {
        Get-Childitem -filter $Filter -Recurse | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object Path -Unique
    }
}