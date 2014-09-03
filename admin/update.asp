<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<%
tipo		= request.QueryString("tipo")
id 			= request("id")

if tipo="1" then

titulo = request.form("txtTitulo")
info = request.form("txtInfo")
descricao = request.form("txtDescricao")

'salva todos os dados na tabela correspondente ao ID'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"trabalhos SET titulo='"& titulo &"', info='"& info &"', descricao='"& descricao &"' WHERE id="&id
updateRs.open editSQL, Conexao



response.redirect("lista.asp?tipo=2")



elseif tipo="2" then
'**********************************************
'  inclui trabalho
'**********************************************

'salva todos os dados na tabela correspondente ao ID'
set updateRs=Server.CreateObject("ADODB.recordset")
for numero=1 to 17
	editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&numero&"='s' WHERE disp"&numero&"='a'"
	updateRs.open editSQL, Conexao
next

response.redirect("lista.asp?tipo=3")


elseif tipo="3" then
'**********************************************
'  FAZ O UPLOAD DA IMAGEM
'**********************************************










elseif tipo="4" then
'**********************************************
'  FAZ O UPLOAD DA IMAGEM
'**********************************************



	
end if
%>
