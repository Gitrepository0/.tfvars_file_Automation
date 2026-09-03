$codePath = Join-Path $env:BUILD_SOURCESDIRECTORY "Code"

$csvFile = Join-Path $codePath "rg.csv"
$tfvarsFile = Join-Path $codePath "terraform.tfvars"

$resourceGroups = Import-Csv $csvFile

$output = @()
$output += 'resource_groups = {'

foreach ($rg in $resourceGroups) {
    $output += "  `"$($rg.rg_name)`" = {"
    $output += "    location = `"$($rg.location)`""
    $output += "  }"
}

$output += '}'

$output | Set-Content $tfvarsFile

Write-Host "terraform.tfvars created successfully."
Write-Host "----------------------------------------"
Get-Content $tfvarsFile