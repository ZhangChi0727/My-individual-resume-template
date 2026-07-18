# build.ps1 — Compile both resume variants with XeLaTeX.
# Usage: powershell -File build.ps1
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

foreach ($doc in @("resume-en", "resume-zh")) {
    Write-Host "==> Building $doc.pdf"
    xelatex -interaction=nonstopmode -halt-on-error "$doc.tex" | Out-Null
    xelatex -interaction=nonstopmode -halt-on-error "$doc.tex" | Out-Null
    if (Test-Path "$doc.pdf") {
        Write-Host "    OK -> $doc.pdf"
    } else {
        Write-Host "    FAILED, see $doc.log"
    }
}
