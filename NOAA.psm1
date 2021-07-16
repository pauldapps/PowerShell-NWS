function Get-NOAAAlerts {
    [CmdletBinding(DefaultParameterSetName = "zone")]
    param (
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = "zone")]
        [string[]]$Zone,
        [Parameter(ValueFromPipelineByPropertyName, ParameterSetName = "State")]
        [string[]]
        $State
    )
    process {    
        switch ($PSBoundParameters.Keys) {
            "zone" {
                foreach ($z in $zone) {
                    try {
                        (invoke-restmethod "https://api.weather.gov/alerts/active?zone=$z").features.properties
                    }
                    catch {
                    }
                }  
            }
            "state" {
                foreach ($s in $State) {
                    try {
                        (invoke-restmethod "https://api.weather.gov/alerts/active?area=$s").features.properties
                    }
                    catch {
                    }
                } 
            }
            Default {}
        }
    }
}