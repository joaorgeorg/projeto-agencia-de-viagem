$files = Get-ChildItem -Path "c:\Users\Georg\Documents\PROJETOS\projeto-agencia-de-viagem" -Filter "*.html"
$utf8 = [System.Text.Encoding]::UTF8
$win1252 = [System.Text.Encoding]::GetEncoding(1252)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($file in $files) {
    try {
        # Lê o texto como está hoje (com os caracteres duplamente codificados, ex: Ãª)
        $mangledText = [System.IO.File]::ReadAllText($file.FullName, $utf8)
        
        # Converte de volta para os bytes originais interpretados de forma errada
        $originalBytes = $win1252.GetBytes($mangledText)
        
        # Lê os bytes usando a codificação certa (UTF-8)
        $fixedText = $utf8.GetString($originalBytes)
        
        # Salva o arquivo em UTF-8 sem BOM
        [System.IO.File]::WriteAllText($file.FullName, $fixedText, $utf8NoBom)
        
        Write-Host "Encoding fixed for $($file.Name)"
    } catch {
        Write-Host "Error processing $($file.Name): $_"
    }
}
