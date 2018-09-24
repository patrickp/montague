Dim PhantomAction
Dim PhantomIndex

Function PhantomsDetailContainersInit()
  console.log("Appending PhantomsDetailContainer")
  PhantomsDetailMainContainer.appendChild(PhantomsDetailContainer)
  
End Function

Function PhantomsDetailBack_onclick()
  ChangeForm(PhantomsListForm)
  phantomsload()
End Function

Function PhantomsDetailSleep_onclick()
  PhantomsDetailSendAction("SLEEP")
End Function

Function PhantomsDetailWakeup_onclick()
  PhantomsDetailSendAction("WAKEUP")
End Function

Function PhantomsDetailStop_onclick()
  PhantomsDetailSendAction("STOP")
End Function

Function PhantomsDetailSendAction(action)
    PhantomAction = action
   NSB.MsgBox(PhantomsDetailSendActionConfirm,PhantomAction & "? Confirm", vbYesNo+vbQuestion, "Confirm Action")
 End Function
 
 Sub PhantomsDetailSendActionConfirm(result)
  If result=vbYes Then 
    Dim payload = {}
    payload.action = PhantomAction
    payload.pid = PhantomRecord.pid
    
    MvAjax(URL,"POST",payload,PhantomsDetailSendActionResponse)
  Else
    NSB.MsgBox("Abort send")
  End If

End Sub

Function PhantomsDetailSendActionResponse(req)
  console.log(req)
  response = req.responseJSON
  NSB.MsgBox("Response: " & req.responseJSON.status & " " & req.responseJSON.statusmessage)
End Function
