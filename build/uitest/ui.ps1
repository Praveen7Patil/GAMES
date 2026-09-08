# Dev-only UI automation helpers for live play-testing the Windows build.
# Dot-source this file, then use Get-AppRect / Focus-App / Capture-Window /
# Click-Screen / Click-Rel. Screenshots are saved under build\uitest\.
if (-not ('Win32H' -as [type])) {
  Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Win32H {
  [StructLayout(LayoutKind.Sequential)]
  public struct RECT { public int Left, Top, Right, Bottom; }
  [DllImport("user32.dll")] public static extern IntPtr FindWindow(string cls, string title);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  [DllImport("user32.dll")] public static extern bool SetForegroundWindow(IntPtr h);
  [DllImport("user32.dll")] public static extern bool SetProcessDPIAware();
  [DllImport("user32.dll")] public static extern bool SetCursorPos(int x, int y);
  [DllImport("user32.dll")] public static extern void mouse_event(uint f, uint dx, uint dy, uint d, UIntPtr e);
}
"@
}
Add-Type -AssemblyName System.Drawing

function Get-AppRect([string]$title) {
  [Win32H]::SetProcessDPIAware() | Out-Null
  $h = [Win32H]::FindWindow($null, $title)
  if ($h -eq [IntPtr]::Zero) { throw "Window '$title' not found" }
  $r = New-Object Win32H+RECT
  [Win32H]::GetWindowRect($h, [ref]$r) | Out-Null
  return $r
}

function Focus-App([string]$title) {
  [Win32H]::SetProcessDPIAware() | Out-Null
  $h = [Win32H]::FindWindow($null, $title)
  if ($h -eq [IntPtr]::Zero) { throw "Window '$title' not found" }
  [Win32H]::SetForegroundWindow($h) | Out-Null
  Start-Sleep -Milliseconds 250
}

function Capture-Window([string]$title, [string]$path) {
  $r = Get-AppRect $title
  $w = $r.Right - $r.Left
  $ht = $r.Bottom - $r.Top
  $bmp = New-Object System.Drawing.Bitmap($w, $ht)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.CopyFromScreen($r.Left, $r.Top, 0, 0, $bmp.Size)
  $g.Dispose()
  $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $bmp.Dispose()
  return "SAVED $path size=${w}x${ht} win=($($r.Left),$($r.Top))"
}

function Click-Screen([int]$x, [int]$y, [int]$settleMs = 50) {
  [Win32H]::SetCursorPos($x, $y) | Out-Null
  Start-Sleep -Milliseconds $settleMs
  [Win32H]::mouse_event(2, 0, 0, 0, [UIntPtr]::Zero)  # LEFTDOWN
  Start-Sleep -Milliseconds 40
  [Win32H]::mouse_event(4, 0, 0, 0, [UIntPtr]::Zero)  # LEFTUP
}

function Click-Rel([string]$title, [double]$dx, [double]$dy, [int]$settleMs = 50) {
  $r = Get-AppRect $title
  Click-Screen ([int]($r.Left + $dx)) ([int]($r.Top + $dy)) $settleMs
}
