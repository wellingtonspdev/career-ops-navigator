# Install script for career-ops-navigator (Windows PowerShell)

$ErrorActionPreference = "Stop"

Write-Host "🚀 Instalando career-ops-navigator globalmente..." -ForegroundColor Cyan

$RepoRoot = $PSScriptRoot
if (-not $RepoRoot) {
    $RepoRoot = Get-Location
}

$SourceSkill = Join-Path $RepoRoot ".agents\skills\career-ops-navigator"
if (-not (Test-Path $SourceSkill)) {
    $SourceSkill = $RepoRoot
}

$Targets = @(
    "$HOME\.claude\skills\career-ops-navigator",
    "$HOME\.codex\skills\career-ops-navigator",
    "$HOME\.copilot\skills\career-ops-navigator",
    "$HOME\.gemini\config\skills\career-ops-navigator"
)

foreach ($Target in $Targets) {
    $ParentDir = Split-Path -Parent $Target
    if (-not (Test-Path $ParentDir)) {
        New-Item -ItemType Directory -Force -Path $ParentDir | Out-Null
    }
    Copy-Item -Recurse -Force $SourceSkill $Target
    Write-Host "  ✅ Instalado em: $Target" -ForegroundColor Green
}

Write-Host "🎉 Instalação concluída! Reinicie seu CLI de IA ou abra uma nova sessão." -ForegroundColor Green
