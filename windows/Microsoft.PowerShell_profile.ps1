# FUNCTIONS
function df {
get-volume
}

function head {
  param($Path, $n = 10)
  Get-Content $Path -Head $n
}

function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

function pkill($name){
Get-Process $name --ErrorAction SilentlyContinue | Stop-Process
}

function reload {
. $PROFILE
}

function head {
  param($Path, $n = 10)
  Get-Content $Path -Head $n
}

function sysinfo { Get-ComputerInfo }

function touch($file){
"" | Out-File $file - Encoding ASCII
}

function which($name){
Get-Command $name | Select-Object -ExpandProperty Definition
}

# STARSHIP
$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
Invoke-Expression (&starship init powershell)

# ZOXIDE
Invoke-Expression (& { (zoxide init powershell | Out-String) } )
