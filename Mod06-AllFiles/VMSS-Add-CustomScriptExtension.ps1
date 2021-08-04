# Connect Azure
Connect-AzAccount

# Set Script 
$customConfig = @{ 
  "fileUris" = (,"https://raw.githubusercontent.com///VMSS-Install-IIS_v1.ps1"); 
  "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File VMSS-Install-IIS_v1.ps1" 
} 

# Set VMSS variables
$rgname = "rgname"
$vmssname = "vmssname"
 
# Get VMSS object 
$vmss = Get-AzVmss -ResourceGroupName $rgname -VMScaleSetName $vmssname
 
# Add VMSS extension 
$vmss = Add-AzVmssExtension -Name "CustomScript" -VirtualMachineScaleSet $vmss -Publisher "Microsoft.Compute" -Type "CustomScriptExtension" -TypeHandlerVersion "1.9" -Setting $customConfig

# Update VMSS 
Update-AzVmss -ResourceGroupName $rgname -Name $vmssname -VirtualMachineScaleSet $vmss

# Optional
# Remove VMSS extension
Remove-AzVmssExtension -VirtualMachineScaleSet $vmss -Name "CustomScript" -Confirm

# Update VMSS 
Update-AzVmss -ResourceGroupName $rgname -Name $vmssname -VirtualMachineScaleSet $vmss



