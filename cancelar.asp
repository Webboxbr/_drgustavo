<!--#include file="admin/conexao.asp" -->

<%
'captura as informações da página anterior'
id = request.querystring("id")
h = request.querystring("h")
n = request.querystring("n")

'marca o horário como livre'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&n&"='s' WHERE id="&id
updateRs.open editSQL, Conexao


response.redirect("consultas.asp")
%>