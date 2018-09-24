Function MvAjax(URL, PostType, PayLoad, ReturnFunction)
  console.log(ReturnFunction)
  console.log(URL)
  PayLoadJson = JSON.stringify(PayLoad)
  URL = RTrim(URL)

  JavaScript
  var settings = {
  "async": true,
  "crossDomain": true,
  "url": URL,
  "method": PostType,
  "headers": {
    "Content-Type": "application/json",
    "X-API-KEY": "12345"
  },
  "processData": false,
  "complete": ReturnFunction,
  "data": PayLoadJson
}
$.ajax(settings);
  End JavaScript

End Function

Function MyLogger(logmessage,loglevel)
    console.log(logmessage)
    
  End Function
  
  Function MyConvertDateToInputDate(datetoconvert)
  ' right now we will convert 11/11/2001 to 2001-11-2001
   d=Split(datetoconvert,"/")
   If Len(d(0)) = 1 Then 
   End If
  
   
   NewDate = d(2) + "-" + d(0) + "-" + d(1)
  return NewDate
End Function
