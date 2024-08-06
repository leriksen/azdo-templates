$apiVersion = "2024-07-01"

Write-Host "creating datasource python, in https://leif-ai-search.search.windows.net, using data from datasource-1.json"

$body = Get-Content data-1.json | ConvertFrom-Json | ConvertTo-Json -Compress -Depth 10
$uri = "https://leif-ai-search.search.windows.net/datasources('python')?api-version=${apiVersion}"

$tokenRequest = az account get-access-token --scope https://search.azure.com/.default | ConvertFrom-Json
$token = "Bearer {0}" -f $tokenRequest.accessToken

Invoke-RestMethod -Method PUT -Uri $uri -Body $body -Headers @{
    "Authorization" = "$token"
    "Content-Type"  = "application/json"
}