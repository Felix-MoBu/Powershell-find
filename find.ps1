function find {
    Param(
        [Parameter(Mandatory)]
        [string]$Search,

        [Parameter(HelpMessage="Don't include sub directories")]
        [switch]$NoRecurse = $false,

        [Parameter(HelpMessage="Interprets the search term as regular expression")]
        [switch]$UseRegEx = $false,

        [Parameter(HelpMessage="Definde file type filters here")]
        [string]$Filter = "*.*",

        [Parameter(HelpMessage="Show only file names, no paths")]
        [switch]$NoPath
        )

    if ($UseRegEx) {
        $escapedSearch = $Search
    } else{
        $escapedSearch = [Regex]::Escape($Search)
    }
    
    if ($NoRecurse) {
        if ($NoPath)
        {
            Get-Childitem -filter $Filter | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object FileName -Unique             
        } else {
            Get-Childitem -filter $Filter | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object Path -Unique 
        }
    } else {
        if ($NoPath)
        {
            Get-Childitem -filter $Filter -Recurse | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object FileName -Unique    
        } else {
            Get-Childitem -filter $Filter -Recurse | Select-String -Pattern $escapedSearch -ErrorAction SilentlyContinue | Select-Object Path -Unique
        }
    }
}