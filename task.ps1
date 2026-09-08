# Write your code here
# Назва групи ресурсів та вихідного файлу
$resourceGroupName = "mate-azure-task-5"
$outputFile = "result.json"

# Отримуємо диски з групи ресурсів та відфільтровуємо лише непідключені
$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName | Where-Object {
    $_.DiskState -eq 'Unattached' -or [string]::IsNullOrEmpty($_.ManagedBy)
}

# Конвертуємо результат у формат JSON та зберігаємо у result.json
$unattachedDisks | ConvertTo-Json -Depth 10 | Out-File -FilePath $outputFile -Encoding utf8
