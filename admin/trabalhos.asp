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


<link href="ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script src="ckeditor/_samples/sample.js" type="text/javascript"></script>

<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>
<script src="js/mascaras.js"></script>
<script src="assets/js/bootstrap.js"></script>
</head>


<div class="header">
	<div class="margens">
		<div><!--#include file="topo.asp" --></div>
	</div>
</div>
<div class="menu">
	<!--#include file="menu.asp" -->
</div>

<div id="geral">
<div style="height:10px;"></div>


<form id="formCadastro" name="formCadastro" method="POST" action="">
	<textarea name="txtDescricao" id="txtDescricao"></textarea></label>
    <script type="text/javascript">
CKEDITOR.replace( 'txtDescricao',
{
	filebrowserBrowseUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/ckfinder.html',
	filebrowserImageBrowseUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/ckfinder.html?type=Images',
	filebrowserFlashBrowseUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/ckfinder.html?type=Flash',
	filebrowserUploadUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files',
	filebrowserImageUploadUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images',
	filebrowserFlashUploadUrl : '/clientes/drgustavo/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash',
	//filebrowserWindowWidth : '1000',
 	//filebrowserWindowHeight : '700'
});
    </script>
</form>    


<div style="height:50px;"></div>
</div>

<div class="footer">
<!--#include file="rodape.asp" -->
</div>

<script>
	$("#bloco").css("display", "block");
</script>






</body>
</html>
