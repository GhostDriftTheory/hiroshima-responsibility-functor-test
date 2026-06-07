$ErrorActionPreference = "Stop"

Write-Host "Checking HiroshimaResponsibility.lean..."
lake env lean HiroshimaResponsibility.lean

Write-Host "Building Lake package..."
lake build

$forbidden = Select-String `
  -Path "HiroshimaResponsibility.lean" `
  -Pattern "\bsorry\b|\badmit\b|axiom AdmBV|axiom hiroshima_conditioned|axiom autonomous|axiom nuclear_ai" `
  -Quiet

if ($forbidden) {
  throw "Forbidden proof-gap pattern found in HiroshimaResponsibility.lean."
}

Write-Host "Lean checks passed."
