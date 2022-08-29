param (
    [string]$time = 10,
    [switch]$silent = $false
 )



$nordPath = 'C:\Program Files\NordVPN\'

"[i] Checking NordVPN folder ..."
if (Test-Path -Path $nordPath) {

    while($true) {

        # Call an external server to get the current public IP address
        $ipAddress = (Invoke-WebRequest -uri "https://ifconfig.me/ip").Content

        # Getting a random server location from the text file
        $rndCountry = Get-Random -InputObject (get-content assets/countrylist.txt)
        $StartTime = Get-Date

        # Checks if the parameter false is set or not
        if ($silent -eq $false) {
            # Windows notification
            New-BurntToastNotification -AppLogo $PSScriptRoot'\assets\powershell.png' -Text 'NordVPN IP Changer','Your IP address will be changed soon.',"$rndCountry ($ipAddress) is your current location."
            # Wait a moment after the notification was sent to not surprise the user with the internet connection interruption
            Start-Sleep -Seconds 10
        }
        
        # Starts a new NordVPN connecion. List of arguments are here : https://support.nordvpn.com/Connectivity/Windows/1350897482/Connect-to-NordVPN-app-on-Windows-using-the-Command-Prompt.htm
        Start-Process "C:\Program Files\NordVPN\NordVPN.exe" -ArgumentList "-c -g '$rndCountry'"

        write-host "[i] Your new virtual residence is in $rndCountry, it will last $time minutes."
      
        
        do { Start-Sleep -Seconds 5 } until ((get-date) -ge ($StartTime.AddMinutes($time)))
    }

   

} else {
    "NordVPN is either not installed or not in the directory 'C:\Program Files\NordVPN\' "
}

