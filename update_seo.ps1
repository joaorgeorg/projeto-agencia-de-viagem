$files = Get-ChildItem -Path "c:\Users\Georg\Documents\PROJETOS\projeto-agencia-de-viagem" -Filter "*.html"

$keywords_old = '<meta content="" name="keywords">'
$keywords_new = '<meta content="viagens, turismo, pacotes de viagem, agência de turismo, passagens, hotel" name="keywords">'

$desc_old = '<meta content="" name="description">'
$desc_new = '<meta content="Tourist - A sua melhor agência de viagens. Descubra o mundo com conforto e segurança. Oferecemos pacotes exclusivos para os melhores destinos." name="description">'

$favicon_old = '<link href="img/favicon.ico" rel="icon">'
$favicon_new = '<!-- <link href="img/favicon.ico" rel="icon"> -->'

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    $content = $content -replace [regex]::Escape($keywords_old), $keywords_new
    $content = $content -replace [regex]::Escape($desc_old), $desc_new
    $content = $content -replace [regex]::Escape($favicon_old), $favicon_new
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    Write-Host "Updated $($file.Name)"
}
