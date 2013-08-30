# This script is derived from the dotless build script.
function Generate-Assembly-Info
{
    param(
        [string]$file = $(throw "file is a required parameter."),
        [string]$title,
        [string]$description,
        [string]$product,
        [string]$copyright,
        [string]$version		
    )
    
    $assemblyInfo = 
"//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by the build system.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Reflection;
using System.Runtime.InteropServices;

[assembly: ComVisible(false)]
[assembly: AssemblyTitle(""$title"")]
[assembly: AssemblyDescription(""$description"")]
[assembly: AssemblyProduct(""$product"")]
[assembly: AssemblyCopyright(""$copyright"")]
[assembly: AssemblyVersion(""$version"")]
[assembly: AssemblyInformationalVersion(""$version"")]
[assembly: AssemblyFileVersion(""$version"")]
[assembly: AssemblyDelaySign(false)]"

    Generate-File-Content `
        -file $file `
        -content $assemblyInfo
}

function Generate-File-Content
{
    param(
        [string]$file = $(throw "file is a required parameter."),
        [string]$content = $(throw "content is a required parameter.")
    )
    
    $dir = [System.IO.Path]::GetDirectoryName($file)
    if ([System.IO.Directory]::Exists($dir) -eq $false)
    {
        [System.IO.Directory]::CreateDirectory($dir)
    }

    Out-File -FilePath $file -Encoding UTF8 -InputObject $content
}
