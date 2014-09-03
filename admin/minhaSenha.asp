<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->


<%
usuario = session("user")
idUser = session("id")
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
<div class="logoMenor"></div>

<div class="logoff"><!--#include file="topo.asp" --></div>

<div style="clear:both"></div>

</div>

<div class="menu">

<!--#include file="menu.asp" -->

</div>

<div class="corpo">

<div class="titTabela">Alterar Senha</div>



<form id="formCadastro" name="formCadastro" method="post" action="gravasenha.asp">

	
    <br />
	<br />

    <label for="txtNomeVideo">Nome</label>
    <input name="txtNomeVideo" type="text" disabled="disabled" class="cx-form" id="txtNomeVideo" value="<%=usuario%>" />
    
    <label for="txtSenha">Nova senha</label>
    <input name="txtSenha" type="password" class="cx-form" id="txtSenha" value="" />
    
    <label for="txtConfirma">Confirmar nova senha</label>
    <input name="txtConfirma" type="password" class="cx-form" id="txtConfirma" value="" />
    
    <input name="txtID" id="txtID" type="hidden" value="<%=idUser%>" />
    
    <br />
	<br />
    
    <input type="submit" name="button" id="button" value="Enviar" />
    
</form>

</div>

<div style="clear:both"></div>

<div class="rodape"><!--#include file="rodape.asp" --></div>


</div>


</body>
</html>
