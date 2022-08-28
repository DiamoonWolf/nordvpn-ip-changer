
# NordVPN IP Changer



## Dependencies
 You will have to install BurnToast to get windows notifications.

PowerShell Gallery Install (Requires PowerShell v5)

```powershell
Install-Module -Name BurntToast
```


## Usage

Use parameter `-silent` to not display notifications.

Use parameter `-time x` to change your IP address every x minutes. 

Example :
```powershell
.\change-ip.ps1 -time 30 -silent
```



