param(
    [Parameter(Mandatory=$True,Position=1,HelpMessage="Please enter '1' or '2'. '1' means to scan LocalServer32 keys and '2' means to scan InprocServer32 keys.")]
    [int]$type
)

function LocalServer32Check{
    $comSettingList = Get-WmiObject Win32_COMSetting | ?{ $_.LocalServer32 -ne $null }
    forEach ($comSetting in $comSettingList){
        $path=Get_Path($comSetting.LocalServer32)
        $result=cmd /c dir $path 2>&1
        
        if($result.FullyQualifiedErrorId -eq "NativeCommandError")
        { 
            "[+]ComponentId: "+$comSetting.ComponentId
            "[+]LocalServer32: "+$path
            ""
        }
            
    } 
}

function InprocServer32Check{
    $comSettingList = Get-WmiObject Win32_COMSetting | ?{ $_.InprocServer32 -ne $null }
    forEach ($comSetting in $comSettingList){
        $path=Get_Path($comSetting.InprocServer32)
        $result=cmd /c dir $path 2>&1
        
        if($result.FullyQualifiedErrorId -eq "NativeCommandError")
        { 
            "[+]ComponentId: "+$comSetting.ComponentId
            "[+]InprocServer32: "+$path
            ""
        }
    }
}

function Get_Path($path){
    $path=$path -replace "\s{1}(-).*",""
    $path=$path -replace "\s{1}(/).*",""
    if($path -match "%(.*?)%")
    {
        $env=$matches[1]
        $envPath=Get-ChildItem env:$env
        $path=$path -replace "%(.*?)%",$envPath.value
        $path 
    }
    return $path
}

if($type -eq 1)
{
    "[+]Scan for abandoned LocalServer32 keys: "
    ""
    LocalServer32Check
}
if($type -eq 2)
{
    "[+]Scan for abandoned InprocServer32 keys: "
    ""
    InprocServer32Check
}

