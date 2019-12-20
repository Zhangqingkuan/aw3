#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#include <inet.au3>
#include <INet.au3>
#include <Array.au3>

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=C:\WINDOWS\system32\SHELL32.dll|-19
#PRE_Outfile=D:\Users\Administrator\桌面\IP地址自动设置.exe
#PRE_UseUpx=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

$tBuffer = 0
$pBuffer = DllStructGetPtr($tBuffer) ; 获取内存指针。
$tagADPTINFO = "ptr NextAdpt; dword ComboIndex; char AdptName[260]; char AdptDescr[132];uint AddrLength;byte MacAddr[8];dword Index;uint Type; uint DhcpEnabled;ptr CurrentIpAddr;ptr NextIpAddr; char IpAddr[16];char IpAddrMask[16]; dword IpAddrCxt; ptr NextGateway; char GatewayAddr[16];char GatewayAddrMask[16];dword GatewayCxt; ptr NextDhcp; char DhcpAddr[16]; char DhcpAddrMask[16];dword DhcpCxt; int HaveWins; ptr NextPriWinsServer; char PriWinsServerAddr[16]; char PriWinsServerAddrMask[16]; dword PriWinsServerCxt; ptr NextSecWinsServer; char SecWinsServerAddr[16];char SecWinsServerAddrMask[16]; dword LeaseObtained; dword LeaseExpires"

$Ip = @IPAddress1
$zw = "255.255.255.0"
;$GW = "192.168.9" &".1"
$DNS1 = "8.8.8.8"
$DNS2 = "114.114.114.114"

$tAdpt = DllStructCreate($tagADPTINFO, $pBuffer)
$GW= DllStructGetData($tAdpt, "GatewayAddr") ; 网关地址
MsgBox( 0,"",$Ip & $zw &" GW:"&$GW &" DNS1:"&$DNS1 &$DNS2)


TrayTip("IP设置工具","正在设置本地连接IP地址:" & $Ip,1)
RunWait('netsh interface ip set address name = "本地连接" source = static addr = ' & $Ip & ' mask = ' & $zw & ' gateway = ' & $GW & ' gwmetric = 0', "c:\windows\system32", @SW_HIDE)
TrayTip("IP设置工具","正在设置本地连接首选DNS为:"& $DNS1,1)
RunWait('netsh interface ip set dns name = "本地连接" source = static addr = ' & $DNS1 & ' register = PRIMARY', "c:\windows\system32", @SW_HIDE)
TrayTip("IP设置工具","正在设置本地连接备用DNS为:"& $DNS2 ,1)
RunWait('netsh interface ip add dns name = "本地连接" addr = ' & $DNS2 & ' index=2', "c:\windows\system32", @SW_HIDE)


