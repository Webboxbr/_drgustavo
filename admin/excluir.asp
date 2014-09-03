<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->
<%

tipo 		= request("tipo")
id 			= request("id")
idProjeto	= request("idProjeto")
tab			= request("tab")

set DeleteRs=Server.CreateObject("ADODB.recordset")

if tipo="1" then
'**********************************************
'  flag n para trabalhos
'**********************************************
'salva todos os dados na tabela correspondente ao ID'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"trabalhos SET ativa='n' WHERE id="&id
updateRs.open editSQL, Conexao

response.redirect("lista.asp?tipo=2")



elseif tipo="2" then

end if
%>