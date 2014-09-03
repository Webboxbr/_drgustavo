<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->


<%
erro = request.QueryString("ret")
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Iso-8859-1" />
<title><%=tituloHome%></title>
<link href="css/style_adm.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>
</head>

<body onLoad="javascript:reiniciarContadorSessao();">

<div id="geral">
    <div class="cabecalho">
        <div class="logoMenor" onclick="location.href='admin.asp'"></div>
        <div class="logoff"><!--#include file="topo.asp" --></div>
        <div style="clear:both"></div>
    </div>

<div class="menu"><!--#include file="menu.asp" --></div>

<div class="corpo">

<%
if erro = "senhaErrada" then
response.Write("<div style='font-size:16px; text-align:center'>As senhas estão diferentes, clique no link abaixo para voltar e corrigir.</div>")
response.Write("<div style='font-size:16px; text-align:center'><a href='javascript:history.back();'>Voltar</a></div>")
end if
%>

</div>

<div style="clear:both"></div>

<div class="rodape"><!--#include file="rodape.asp" --></div>
</div>
 
</body>
</html>
