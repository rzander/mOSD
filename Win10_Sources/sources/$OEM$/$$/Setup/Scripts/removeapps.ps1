Set-Location $PSScriptRoot

Get-AppxProvisionedPackage -online | Where-Object { $_.DisplayName -like "*skype*" -or $_.DisplayName -like "*windowscomm*" -or $_.DisplayName -like "*onenote*" -or $_.DisplayName -like "*Office*"  } | Remove-AppxProvisionedPackage -online

$apps=@(     
    "9E2F88E3.Twitter"
    "ClearChannelRadioDigital.iHeartRadio"
    "Flipboard.Flipboard"
    "king.com.CandyCrushSodaSaga"
    "Microsoft.3DBuilder"
    #"Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingWeather"
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
	"Microsoft.WindowsFeedbackHub"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    #"Microsoft.Office.OneNote"
    #"Microsoft.Office.Sway"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    "Microsoft.Windows.Phone"
    #"Microsoft.Windows.Photos"
    #"Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    #"Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    #"Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    #"Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "microsoft.windowscommunicationsapps"
    "Microsoft.MinecraftUWP"
    "ShazamEntertainmentLtd.Shazam"        
)

foreach ($app in $apps) {    
    Get-AppxPackage -Name $app | Remove-AppxPackage
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online
            
    $appPath="$Env:LOCALAPPDATA\Packages\$app*"
    #Remove-Item $appPath -Recurse -Force -ErrorAction 0
}

exit(0)