<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<%
id 		= request.querystring("id")
n 		= request.querystring("disp")


'marca o horário como bloqueado'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&n&"='i' WHERE id="&id
updateRs.open editSQL, Conexao

response.redirect("consultas.asp")
%>