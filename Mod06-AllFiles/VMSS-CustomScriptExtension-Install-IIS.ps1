# Connect Azure
Connect-AzAccount

# Set Script 
$customConfig = @{ 
  "fileUris" = (,"SourceGitHub"); 
  "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File ScriptName.ps1" 
} 

# Set VMSS variables
$rgname = "ResourceGroup"
$vmssname = "VMSSName"
 
# Get VMSS object 
$vmss = Get-AzVmss -ResourceGroupName $rgname -VMScaleSetName $vmssname
 
# Add VMSS extension 
$vmss = Add-AzVmssExtension -Name "CustomScript" -VirtualMachineScaleSet $vmss -Publisher "Microsoft.Compute" -Type "CustomScriptExtension" -TypeHandlerVersion "1.9" -Setting $customConfig 
 
# Update VMMS 
Update-AzVmss -ResourceGroupName $rgname -Name $vmssname -VirtualMachineScaleSet $vmss 
