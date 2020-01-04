﻿function Set-WinADTombstoneLifetime {
    [cmdletBinding()]
    param(
        [int] $Days
    )
    $Partition = $((Get-ADRootDSE).configurationNamingContext)
    Set-ADObject -Identity "CN=Directory Service,CN=Windows NT,CN=Services,$Partition" -Partition $Partition -Replace @{ tombstonelifetime = $Days }
}