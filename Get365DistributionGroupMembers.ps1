$ExportPath = "C:\Users\mariahr.GO-DOMAIN\OneDrive - Integris\Documents"
$Groups = Get-DistributionGroup -ResultSize Unlimited
$Groups | ForEach-Object {
$group = $_
Get-DistributionGroupMember -Identity $group.Name -ResultSize Unlimited | ForEach-Object {
      New-Object -TypeName PSObject -Property @{
       Group = $group.DisplayName
       Member = $_.Name
       EmailAddress = $_.PrimarySMTPAddress
       RecipientType= $_.RecipientType
}}} | Export-CSV "$ExportPath\DistributionGroups.csv" -NoTypeInformation -Encoding UTF8
Invoke-Item "$ExportPath\DistributionGroups.csv"