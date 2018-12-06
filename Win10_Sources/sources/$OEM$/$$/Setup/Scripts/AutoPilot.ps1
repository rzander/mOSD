exit 0

#Azure Automation Webhook URI
$uri = "https://s2events.azure-automation.net/webhooks?token=IzxFg%2baOung4RWr8w45SF8WfHRot5RmIwIsnVP9ltkg%3d"

#Get Hardware Hash
$hwid = ((Get-WMIObject -Namespace root/cimv2/mdm/dmmap -Class MDM_DevDetail_Ext01 -Filter "InstanceID='Ext' AND ParentID='./DevDetail'").DeviceHardwareData)
#Get SerialNumber
$ser = (Get-WmiObject win32_bios).SerialNumber
#Use Computername if SerialNumber is empty
if([string]::IsNullOrWhiteSpace($ser)) { $ser = $env:computername}  
$orderIdentifier = "DevCDR"

#Create Object with the required parameters
$devdata  = @{ SerialNumber=$ser;HardwareHash=$hwid;OrderIdentifier=$orderIdentifier}
$body = ConvertTo-Json -InputObject $devdata 

#Send Request to Webhook
$response = Invoke-RestMethod -Method Post -Uri $uri -Body $body
$response.JobIds