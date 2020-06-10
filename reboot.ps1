function ConvertTime() {
    param ([switch]$t = $false, [string]$time)
    if ($t -eq $True){
        $hour, $min = "$time" -split ':'
        $time = (Get-Date -hour $hour -minute $min -second 0)
        $seconds = (New-TimeSpan -Start (Get-Date) -End $time).TotalSeconds
        $global:seconds = $seconds        
    }
    else {
        $time, $unit = "$time" -split '(?=\D)'
        if ($unit -eq 's') {$seconds = [int]$time}
        ElseIf ($unit -eq 'm') {$seconds = [int]$time * 60}
        ElseIf ($unit -eq 'h') {$seconds = [int]$time * 3600}
        ElseIf ($unit -eq 'd') {$seconds = [int]$time * 86400}
        else {echo "Use (s)econds, (m)inutes, (h)ours, or (d)ays"}
        $global:seconds = $seconds
    }
}
ConvertTime @args
if ($seconds -gt 0) {
    $time = (Get-Date)
    $addseconds = New-TimeSpan -seconds $seconds
    $newtime = $time + $addseconds
    "Adding $seconds seconds to $time" 
    "Computer will reboot on $newtime"
}
else {"Pick a date in the future!"}

shutdown /r /t $seconds
