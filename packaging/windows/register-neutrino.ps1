# NEUTRINO (v3.2 以上の Windows 版) を、このフォルダの OpenUtau から使えるようにする。
# NEUTRINO 本体とモデルには書き込まない。管理者権限は要らない。
param([string]$Neutrino = "")
$ErrorActionPreference = "Stop"
$ou = $PSScriptRoot
if (-not $Neutrino) {
  Write-Host "NEUTRINO のフォルダをこのウィンドウへドラッグして、Enter を押してください。"
  $Neutrino = Read-Host
}
$ne = $Neutrino.Trim().Trim('"').Trim("'").TrimEnd('\')
if (-not (Test-Path (Join-Path $ne "bin\NEUTRINO.exe")) -or -not (Test-Path (Join-Path $ne "model"))) {
  Write-Host "NEUTRINO のフォルダではないようです (bin\NEUTRINO.exe と model\ がありません): $ne"; exit 1
}
if (-not (Test-Path (Join-Path $ou "OpenUtau.exe"))) {
  Write-Host "このスクリプトは OpenUtau.exe と同じフォルダに置いて実行してください。"; exit 1
}
$dep = Join-Path $ou "Dependencies"; $sing = Join-Path $ou "Singers"
New-Item -ItemType Directory -Force -Path $dep, $sing | Out-Null
$link = Join-Path $dep "NEUTRINO_v3"
if (Test-Path $link) {
  $item = Get-Item $link -Force
  if ($item.LinkType -ne "Junction") { Write-Host "$link が既にあります。中身を確認してから消して、もう一度実行してください。"; exit 1 }
  $item.Delete()
}
New-Item -ItemType Junction -Path $link -Target $ne | Out-Null
$utf8 = New-Object System.Text.UTF8Encoding($false)
$n = 0
foreach ($m in Get-ChildItem (Join-Path $ne "model") -Directory) {
  if (-not (Test-Path (Join-Path $m.FullName "info.toml"))) { continue }
  $d = Join-Path $sing ("NEUTRINO_" + $m.Name)
  New-Item -ItemType Directory -Force -Path $d | Out-Null
  foreach ($f in Get-ChildItem $m.FullName -File) {
    $dst = Join-Path $d $f.Name
    if (Test-Path $dst) { Remove-Item $dst -Force }
    try { New-Item -ItemType HardLink -Path $dst -Target $f.FullName | Out-Null }
    catch { Copy-Item $f.FullName $dst }   # 別ドライブなどでハードリンクできない時はコピー
  }
  [IO.File]::WriteAllText((Join-Path $d "character.txt"), "name=$($m.Name) (NEUTRINO)`n", $utf8)
  [IO.File]::WriteAllText((Join-Path $d "character.yaml"), "singer_type: neutrino`ntext_file_encoding: utf-8`ndefault_phonemizer: OpenUtau.Core.Neutrino.NeutrinoLabelPhonemizer`n", $utf8)
  Write-Host "登録しました: $($m.Name) (NEUTRINO)"; $n++
}
if ($n -eq 0) { Write-Host "model\ の中に歌声モデルが見つかりませんでした。"; exit 1 }
Write-Host "完了。OpenUtau を起動し直してください。"
