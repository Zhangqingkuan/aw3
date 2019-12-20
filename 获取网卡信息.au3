#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ACN_NET.au3>

$info = _NetworkAdapterInfo()
MsgBox(1, "", "网卡名称：" & $info[1][1] & @CRLF & "连接名称：" & $info[1][9] & @CRLF & "DNS主机名称：" & $info[1][3] _
         & @CRLF & "IP地址：" & $info[1][4] & @CRLF & "子网掩码：" & $info[1][7] & @CRLF & "默认网关：" & $info[1][2] _
   & @CRLF & "主DNS：" & $info[1][5] & @CRLF & "次DNS：" & $info[1][6] & @CRLF & "MAC地址：" & $info[1][8])



