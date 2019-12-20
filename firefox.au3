#Region ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Language=2052
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include<AutoItConstants.au3>

Send("#{r}")
$hWnd = WinGetHandle("[ACTIVE]");$hWnd 为目标窗口句柄，这里设置的是当前活动窗口
$ret = DllCall("user32.dll", "long", "LoadKeyboardLayout", "str", "08040804", "int", 1 + 0)
DllCall("user32.dll", "ptr", "SendMessage", "hwnd", $hWnd, "int", 0x50, "int", 1, "int", $ret[0])
Sleep(500)
Send("firefox.exe -p -no-remote")
Sleep(500)
Send("{ENTER}")
Sleep(500)
Send("!{d}")
Sleep(500)
Send("{RIGHT}")
Sleep(500)
Send("{ENTER}")
Sleep(500)
Send("{UP}")
Sleep(500)
Send("{UP}")
Sleep(500)
Send("{ENTER}")
Sleep(500)
Send("{ENTER}")
Sleep(500)
Send("{2}")
Sleep(500)
Send("{ENTER}")
Sleep(500)
Send("{DOWN}")
Sleep(500)
Send("{DOWN}")
Sleep(500)
Send("{DOWN}")
Sleep(500)
Send("{ENTER}")
