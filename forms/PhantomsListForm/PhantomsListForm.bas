Dim Phantoms
Dim PhantomRecord = {}

Function phantomsmenu()
  console.log("In phantoms")
  HideAllContainers()
  PhantomsListContainer.show()
 
End Function

Function phantomsload()
   console.log("In phantoms load")
   Dim payload = {}
   payload.action = "LIST"
   console.log(payload)
   MvAjax(URL,"POST",payload,phantomsloadresponse)
   
 End Function
 
 Function phantomsloadresponse(realreq)
   
    console.log("In phantomsloadresponse")
    console.log(realreq)
    Try
      
    req = realreq.responseJSON
    
    numrecords = req.results.length
    Phantoms = req.results
    PhantomsListSelectList.clear()
    
    For i = 1 To numrecords
         record = req.results[i-1]
         console.log(record.program)
         html = "<table width=100%>"
         html = html & "<tr><td width=60%>" & record.program & "</td>"
         html = html & "<td align=right>" & record.datetime & "</td>"
         html = html & "</tr>"
         html = html & "<tr>"
         html = html & "<td width=10%>C: " & record.command & "</td>"
         html = html & "<td>" & record.logon & "</td>"
         html = html & "</tr></table>"
         PhantomsListSelectList.addItem(html)
    Next i
  
     PhantomsListSelectLastRefresh.value = FormatDateTime(Now)
   Catch err
      NSB.MsgBox("Error contacting server")
   End Try
End Function

Function PhantomsListSelectList_onclick(choice)
  console.log("in phantomslistselectlist")
  If TypeName(choice) = "object" Then
    Exit Function
  End If
  console.log(choice)
  
  'NSB.MsgBox("You picked " & Phantoms[choice].program)
  'PhantomsListContainer.hide()
  PhantomsDetailProgram.value = Phantoms[choice].program
  PhantomsDetailCommand.value = Phantoms[choice].command
  PhantomsDetailLogon.value   = Phantoms[choice].logon
  
  PhantomRecord = Phantoms[choice]
  
  
  'PhantomsDetailSleep.disabled = True
  
  'PhantomsDetailMainContainer.show()
  ChangeForm(PhantomDetailForm)
  
  
End Function



Function PhantomsListSelectRefresh_onclick()
  phantomsload()
End Function
