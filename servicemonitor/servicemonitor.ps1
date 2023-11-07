$services = Get-Service
foreach($service in $services) 
{
    switch ($service.status)
    {
        Running {
            $state = 2
        }
        Stopped {
            $state = 1
        }
        default
        {
            $state = 0
        }

    }
    $metric = "name=Custom Metrics|$($service.DisplayName)|status,value=$state"
    Write-Host $metric
}