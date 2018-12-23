##get proc owners
$currentUser = $env:USERNAME
$procs = Get-WmiObject Win32_Process
foreach ($proc in $procs) {
    $owner = (Invoke-WmiMethod -InputObject $proc -Name "GetOwner")
    IF($owner.User -eq $currentUser) {
        "Found current user process: $($proc.Name)"
    }
    IF($owner.User -ne $currentUser) {
        "Found processes owned by others: 
        Process name: $($proc.Name)
        Process owner: $($owner.User)"
    }
}