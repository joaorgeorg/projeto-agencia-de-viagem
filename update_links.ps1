$files = Get-ChildItem -Path "c:\Users\Georg\Documents\PROJETOS\projeto-agencia-de-viagem" -Filter "*.html"

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    if ($content -match 'href=""') {
        $content = $content -replace 'href=""', 'href="javascript:void(0);"'
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
