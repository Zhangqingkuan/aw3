#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here



RunWait(@ComSpec & ' /C wmic Path Win32_NetworkAdapterConfiguration where IPEnabled='True' get IPSubnet /value')


$dns="192.168.0.1"
;RunWait(@ComSpec & ' /C netsh -c interface ip set dns 本地连接 source=static addr="' & $dns)



