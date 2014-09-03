<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<%
'captura as informações da página anterior'
id = request.querystring("id")
h = request.querystring("h")
n = request.querystring("n")

'marca o horário como livre'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"reservas SET confirma"&n&"='s', disp"&n&"='c' WHERE id="&id
updateRs.open editSQL, Conexao


response.redirect("consultas.asp")
%>
