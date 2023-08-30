# For Azure global regions
# Set your Corp Connected Landing Zone subscription ID as the the current subscription
$LandingZoneSubscriptionId = "26538677-7b4b-49b6-9373-d623673297b6"

Select-AzSubscription -SubscriptionId $LandingZoneSubscriptionId

# %% Deploy SDDC Green Field Lite
$inputObject = @{
  DeploymentName        = 'alz-avslzGreenFieldLiteDeploy-{0}' -f (-join (Get-Date -Format 'yyyyMMddTHHMMssffffZ')[0..63])
  #ResourceGroupName     = "rg-avslz-pp-01"
  TemplateFile          = "AVS-Landing-Zone/GreenField Lite/PortalUI/Bicep/GreenFieldLiteDeploy.bicep"
  TemplateParameterFile = "AVS-Landing-Zone/GreenField Lite/PortalUI/Bicep/GreenFieldLiteDeploy.parameters.json"
  Location              = "eastus"
}

New-AzSubscriptionDeployment @inputObject -WhatIf