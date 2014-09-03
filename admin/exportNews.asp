<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Iso-8859-1" />
<title>abecs - newsletter</title>
</head>

<body>

<%
' Excel Maker 1.0 by RaS! (ras78@libero.it), ver 1.0
' --------------------------------------------------
' This is a free and simple example about create Excel files with asp
' You need the Microsoft Excel installed on you machine to use the
' object. Without this one, you cannot create any .xls file.
' Please report any bugs or feedback at ras78@libero.it



Set rsNews = Server.CreateObject("ADODB.Recordset")
rsNews.Open "select * from "&prefixoTabela&"newsletter order by id asc", Conexao

Response.ContentType = "application/vnd.ms-excel"
'Response.ContentType = "application/vnd.ms-word" 
Response.AddHeader "content-disposition","attachment;filename=lista_news.xls"
'Response.AddHeader "content-disposition","attachment;filename=entidades.doc"

Response.Buffer = TRUE

%>



<table width="100%" border="1" cellspacing="2" cellpadding="2">

    <tr>
    <td width="13%"><strong>COD</strong></td>
    <td width="87%"><strong>Email:</strong></td>
    </tr>
    
	<%
    Do While Not rsNews.EOF
    %>
    <tr>
    <td align="left"><%=rsNews("id")%></td>
    <td align="left"><%=rsNews("email")%></td>
    </tr>
	<%    
    rsNews.MoveNext
    Loop
    rsNews.close
    %> 
</table>


        
        
        
        
</body>
</html>

