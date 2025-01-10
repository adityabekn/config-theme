Invoke-Expression "$(vfox activate pwsh)"
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -BellStyle None
Set-Alias lzg lazygit
function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

  $out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}
oh-my-posh init pwsh --config ~/ys.omp.json | Invoke-Expression
function Set-WindowTitle {
    $Host.UI.RawUI.WindowTitle = (Get-Item -Path ".").Name
}
Register-EngineEvent PowerShell.OnIdle -Action { Set-WindowTitle } | Out-Null
