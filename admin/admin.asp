<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=tituloHome%></title>
<link href="../css/normalize.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/style_adm.css" rel="stylesheet" type="text/css" />


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>
<script src="js/mascaras.js"></script>
<script src="assets/js/bootstrap.js"></script>
</head>

<body onLoad="javascript:reiniciarContadorSessao();">



<div class="header">
	<div class="margens">
		<div class="desloca-esq"><!--#include file="topo.asp" --></div>
		<span class="clear"></span>
	</div>
</div>
<div class="menu">
	<!--#include file="menu.asp" -->
</div>

<div id="geral">
<div style="height:50px;"></div>

<p class="t30 azul-2 aling-centro">Bem vindo a ferramenta de administração do<br><span class="t50 negrito">Dr. Gustavo Abreu.</span></p>

<p class="t30 azul-2 aling-centro">Utilize o menu acima para encontrar todos os recursos disponíveis.</p>

<div style="height:50px;"></div>
</div>

<div class="footer">
<!--#include file="rodape.asp" -->
</div>

</body>
</html>
