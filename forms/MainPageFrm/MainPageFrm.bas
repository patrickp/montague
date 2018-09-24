'Dim URL="http://127.0.0.1:8180/api/ws-phantom"
'Dim URL="http://localhost:20002/api/ws-phantom"
'Dim URL="https://www.multivaluedb.com/powerbiapi/ws-phantom"
Dim URL="http://localhost:20002/api/request"
Dim CurrentForm=""

Dim receipt = {}
Dim po = {}
Dim inventory = {}

Dim receipts = {}
Dim pos = {}
Dim inventories={}


Dim Authenticated
console.log("Hello Patrick")


Sub Main()
  Authenticated = False
  console.log("ver 1.1")
  DebugServerPort.value = URL
  console.log(URL)
 
  HideAllContainers()
  MainListSelectList.clear()
  NavServerContainer.hide()
  
  DoLogin()
 End Sub

Function HideAllContainers()
  LoginForm.hide()
  MainListForm.hide()
  SummaryMainForm.hide()
  
End Function




Function NavMenu_onclick(choice)
  If TypeName(choice) = "object" Then
    Exit Function
  End If
    console.log(choice)
    If choice = "Receipts" Then
        ChangeForm(MainListForm)
    End If
    If choice = "Logout" Then
       MainListSelectList.clear()
      'NavServer.hide()
      
      NavMenu.disabled = True
      NavServerContainer.hide()
      console.log(NavServerContainer.hidden)
      
      ChangeForm(LoginForm)
    End If
    
End Function

Function NavBack_onclick()
  NavBack.hide()
  
 If CurrentForm = "SummaryMainForm" Then
   ChangeForm(MainListForm)
 End If
 If CurrentForm = "SummaryMainSubForm" Then
   ChangeForm(SummaryMainForm)
 End If
 
 

End Function
