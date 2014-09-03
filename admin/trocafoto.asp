<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->


<%

tipo 		= request("tipo")
id 			= request("id")

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/style_adm.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="geral_pop">


<%
if tipo="1" then
%>
<h1>Trocar a foto para a listagem dos Produtos</h1>
<form id="formCadastro" name="formCadastro" method="POST" enctype="multipart/form-data" action="edita.asp?tipo=5&id=<%=id%>">
  	
    <label for="txtArquivo">Foto destaque* <small>(essa &eacute; a foto que aparece na listagem dos produtos, ela deve ter 200px de largura. A altura pode ser vari&aacute;vel)</small><br />
    <input name="txtArquivo" type="file" id="txtArquivo" /></label>
  
    <input type="image" src="images/botsalvar.jpg" name="button" id="button" value="Submit" />
</form>
<%
elseif tipo="2" then
response.Write("<div style='text-align:center; margin-top:30px'><a href='#' onclick='javascript:window.close();'>Fechar a Janela</a></div>")
elseif tipo="3" then
response.Write("<div style='font-size:16px; text-align:center; margin-top:30px''>A largura da imagem deve ser igual a 200px, a imagem não foi alterada.</div>")
response.Write("<div style='text-align:center;><a href='#' onclick='javascript:window.close();'>Fechar a Janela</a></div>")

elseif tipo="4" then
%>
<h1>Trocar a foto da lateral de Quem Somos</h1>
<form id="formCadastro" name="formCadastro" method="POST" enctype="multipart/form-data" action="edita.asp?tipo=8&id=<%=id%>">
  	
    <label for="txtArquivo">Foto destaque* <small>(essa &eacute; a foto que aparece na listagem das notícias, ela deve ter 340px de largura.)</small><br />
    <input name="txtArquivo" type="file" id="txtArquivo" /></label>
  
    <input type="image" src="images/botsalvar.jpg" name="button" id="button" value="Submit" />
</form>
<%

elseif tipo="5" then


end if
%>
</div>

</body>
</html>
