<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->


<%
		id = request.Form("txtID")
		senha = request.Form("txtSenha")
		confirma = request.Form("txtConfirma")
		
		'Set rsProdutos = Server.CreateObject("ADODB.Recordset")
		'rsProdutos.Open "select * from video order by id desc", Conexao
		
		if senha = confirma then
		
		set addRs=Server.CreateObject("ADODB.recordset")
		editSQL = "UPDATE "&prefixoTabela&"usuarios SET senha='"& senha &"' WHERE id=" & id
		addRs.open editSQL, Conexao
		
		response.Redirect("admin.asp")
		
		else
		
		response.Redirect("erro.asp?ret=senhaErrada")
		
		end if
%>