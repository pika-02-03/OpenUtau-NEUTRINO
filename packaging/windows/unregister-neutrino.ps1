# register-neutrino で作ったものだけを OpenUtau から外す。NEUTRINO 本体・モデル・OpenUtau の作品には触れない。管理者権限は要らない。
$ErrorActionPreference = "Stop"
$ou = $PSScriptRoot
$link = Join-Path $ou "Dependencies\NEUTRINO_v3"
if (Test-Path $link) {
  $item = Get-Item $link -Force
  if ($item.LinkType -eq "Junction") { $item.Delete(); Write-Host "外しました: NEUTRINO へのジャンクション" }  # リンクだけ外す (Remove-Item -Recurse はリンク先まで消すので使わない)
  else { Write-Host "$link はジャンクションではないので触りません。" }
}
$n = 0
$sing = Join-Path $ou "Singers"
if (Test-Path $sing) {
  foreach ($d in Get-ChildItem $sing -Directory -Filter "NEUTRINO_*") {
    $y = Join-Path $d.FullName "character.yaml"
    if (-not ((Test-Path $y) -and (Select-String -Quiet "singer_type: neutrino" $y))) { continue }
    Remove-Item -Recurse -Force $d.FullName   # 中身はハードリンクかコピーなので、元のモデルは消えない
    Write-Host "外しました: $($d.Name)"; $n++
  }
}
Write-Host "完了 (歌手 $n 件)。OpenUtau 本体を消す時は、このフォルダごと削除してください。"
