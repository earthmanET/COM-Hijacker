# COM-Hijacker
The scanner is used to find COM references that may be abused.
# Usage:
```
> COM-Hijacker.ps1
位于命令管道位置 1 的 cmdlet COM-Hijacker.ps1
请为以下参数提供值:
(键入 !? 以查看帮助。)
type: !?
Please enter '1' or '2'. '1' means to scan LocalServer32 keys and '2' means to scan InprocServer32 keys.
type: 

> COM-Hijacker.ps1
位于命令管道位置 1 的 cmdlet COM-Hijacker.ps1
请为以下参数提供值:
(键入 !? 以查看帮助。)
type: 2
[+]Scan for abandoned InprocServer32 keys: 

[+]ComponentId: {00000000-0000-0000-C000-000000000000}
[+]InprocServer32: C:\XXX\XXX\XXX.dll

> COM-Hijacker.ps1
位于命令管道位置 1 的 cmdlet COM-Hijacker.ps1
请为以下参数提供值:
(键入 !? 以查看帮助。)
type: 1
[+]Scan for abandoned LocalServer32 keys: 

[+]ComponentId: {00000000-0000-0000-C000-000000000000}
[+]LocalServer32: C:\XXX\XXX\XXX.exe
```
