; # Win (Windows logo key). 
; ! Alt 
; ^ Control 
; + Shift 
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details. 
; < Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it. 
; > Use the right key of the pair. 

; sys vars
; A_ProgramFiles, C:\Program Files (x86)\


; path
notePath = c:\sync\notes\
workspace = c:\Users\alex.song\workspace\nfc\NfcAppEMV\jni\
home = c:\cygwin\home\alex.song\

;local vars
gvim = C:\Vim\vim74\gvim.exe

editFiles = %notePath%Daily_log_2014.4.txt %notePath%tickets.txt %notePath%gVimNote.txt c:\cygwin\home\alex.song\_gvimrc C:\Users\alex.song\Documents\AutoHotkey.ahk c:\sync\notes\buffer\testing.ahk

sourceFiles = %workspace%apdu.cpp %workspace%apdu.h %workspace%authProtocol.cpp %workspace%authProtocol.h %workspace%mpAgent-jni.c

; for vim
vimrc = %home%vimConfig\_vimrc
gvimrc = %home%vimConfig\_gvimrc
gvim = C:\Vim\vim74\gvim.exe -u %vimrc% -U %gvimrc%

; number pad area
^Numpad1::Run %gvim% -p %editFiles%
^Numpad2::Run C:\Users\alex.song\Documents\AutoHotkey.ahk
^Numpad3::Run C:\Users\alex.song\AppData\Roaming\Baidu\BaiduYun\baiduyun.exe
^Numpad4::Run %gvim% -p %sourceFiles% -c "cd %workspace%"
^Numpad5::Run www.baidu.com
^Numpad6::Run www.google.com
^Numpad7::
Run "C:\Program Files\totalcmd\TOTALCMD64.EXE" 
Run "C:\Users\alex.song\Pictures\Favorites\Links\Microsoft Outlook 2010.lnk"
Run %gvim% -p %editFiles%
return

^Numpad8::
Run %notePath%\buffer\testing.ahk
return

^Numpad9::Run c:\cygwin\Cygwin.bat


; for vim only
; remapping the Esc to Caps
;CapsLock::Esc
; a better way:
classname = ""
keystate = ""

*Capslock::
  WinGetClass, classname, A
  if (classname = "Vim")
  {
    SetCapsLockState, Off
    Send, {ESC}
  }
  else
  {
    GetKeyState, keystate, CapsLock, T
    if (keystate = "D")
      SetCapsLockState, Off
    else
      SetCapsLockState, On
    return
  }
  return

; for home ducky keyboard only
;RCtrl::AppsKey


#`::
; IfWinExist Total Commander (x64) 8.51a - Irdeto Access Technology (Beijing) Co.,Ltd
; here do not have to be full name of the window.
IfWinExist Total Commander
	WinActivate
else
	Run "C:\totalcmd\TOTALCMD.EXE"
return


