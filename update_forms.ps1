$files = Get-ChildItem -Path "c:\Users\Georg\Documents\PROJETOS\projeto-agencia-de-viagem" -Filter "*.html"

$form_old = '<form>'
$form_new = '<form onsubmit="event.preventDefault(); alert(''Sua solicitação foi enviada com sucesso! Entraremos em contato em breve.'');">'

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    if ($content -match "<form>") {
        $content = $content -replace [regex]::Escape($form_old), $form_new
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "Updated $($file.Name)"
    }
}
