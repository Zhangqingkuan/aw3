#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$wbemFlagReturnImmediately = 0x10
$wbemFlagForwardOnly = 0x20
$colItems = ""
$strComputer = "localhost"

$Output=""
$Output = $Output & "计 算 机：" & $strComputer   & @CRLF
$Output = $Output & "==========================================" & @CRLF
$objWMIService = ObjGet("winmgmts:\" & $strComputer & "\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", _
                                          $wbemFlagReturnImmediately + $wbemFlagForwardOnly)

If IsObj($colItems) then
    For $objItem In $colItems
      $Output = $Output & "网    卡： " & $objItem.Description & @CRLF
      ;$strDefaultIPGateway = $objItem.DefaultIPGateway(0)
      $Output = $Output & "默认网关： " & $objItem.DefaultIPGateway(0) & @CRLF


      $Output = $Output & "计算机名： " & $objItem.DNSHostName & @CRLF
      $strIPAddress = $objItem.IPAddress(0)
      $Output = $Output & "I   P地址： " & $strIPAddress & @CRLF
$strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(0)
      $Output = $Output & "默认 DNS： " & $strDNSServerSearchOrder & @CRLF
          $strDNSServerSearchOrder = $objItem.DNSServerSearchOrder(1)
      $Output = $Output & "备用 DNS： "   & $strDNSServerSearchOrder & @CRLF

      $strIPSubnet = $objItem.IPSubnet(0)
      $Output = $Output & "子网掩码： " & $strIPSubnet & @CRLF
      $Output = $Output & "M AC地址： " & $objItem.MACAddress & @CRLF
      if Msgbox(1,"WMI获取的信息：",$Output) = 2 then ExitLoop
      $Output=""
    Next
Else
   Msgbox(0,"WMI Output","No WMI Objects Found for class: " & "Win32_NetworkAdapterConfiguration" )
Endif


