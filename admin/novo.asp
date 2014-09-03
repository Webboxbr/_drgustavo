<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->


<%
tipo 	= request.QueryString("tipo")
id		= request("id")

dia = Day(Date())
mes = MonthName(Month(Date()))
ano = Year(Date())
hora = Hour(Time())
minuto = Minute(Time())
%>

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

<body onLoad="javascript:reiniciarContadorSessao();">


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

<div id="bloco">

<%
if tipo="1" then
'**********************************************
'  INCLUI CLIENTE
'**********************************************
%>




<%
elseif tipo="2" then
'**********************************************
'  novo trabalho
'**********************************************
%>

<p class="semEsp azul-2 t30">Novo Trabalho</p>
<p class="semEsp cinza t15"></p>
<div style="height:30px;"></div>

<form id="frmCad" name="frmCad" method="POST" action="add.asp?tipo=2">


    <label for="txtTitulo">T&iacute;tulo<br />
    <input type="text" name="txtTitulo" id="txtTitulo" class="form1" /></label>

    <label for="txtInfo">Autor<br />
    <input type="text" name="txtInfo" id="txtInfo" class="form1" /></label>

    <label for="txtDescricao">Trabalho<br />
    <textarea name="txtDescricao" id="txtDescricao"></textarea></label>
    <script type="text/javascript">
        CKEDITOR.replace( 'txtDescricao',
        {
            filebrowserBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html',
            filebrowserImageBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html?type=Images',
            filebrowserFlashBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html?type=Flash',
            filebrowserUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images',
            filebrowserFlashUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash',
            //filebrowserWindowWidth : '1000',
            //filebrowserWindowHeight : '700'
        });
    </script>

    <button type="submit" class="btn btn-primary">Publicar</button>
    <button type="button" class="btn btn-default" onclick="location.href='javascript:history.back();'">Cancelar</button>

</form>

<%
elseif tipo="3" then
'**********************************************
'  Edita trabalhos
'**********************************************
Set rsTrabalhos = Server.CreateObject("ADODB.Recordset")
rsTrabalhos.Open "select * from "&prefixoTabela&"trabalhos where id="&id, Conexao
%>

<p class="semEsp azul-2 t30">Edita Trabalho</p>
<p class="semEsp cinza t15"></p>
<div style="height:30px;"></div>

<form id="frmCad" name="frmCad" method="POST" action="update.asp?tipo=1&id=<%=id%>">
    <label for="txtTitulo">T&iacute;tulo<br />
    <input type="text" name="txtTitulo" id="txtTitulo" class="form1" value="<%=rsTrabalhos("titulo")%>" /></label>

    <label for="txtInfo">Autor<br />
    <input type="text" name="txtInfo" id="txtInfo" class="form1" value="<%=rsTrabalhos("info")%>" /></label>

    <label for="txtDescricao">Trabalho<br />
    <textarea name="txtDescricao" id="txtDescricao"><%=rsTrabalhos("descricao")%></textarea></label>
    <script type="text/javascript">
        CKEDITOR.replace( 'txtDescricao',
        {
            filebrowserBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html',
            filebrowserImageBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html?type=Images',
            filebrowserFlashBrowseUrl : '/admin/ckeditor/ckfinder/ckfinder.html?type=Flash',
            filebrowserUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images',
            filebrowserFlashUploadUrl : '/admin/ckeditor/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash',
            //filebrowserWindowWidth : '1000',
            //filebrowserWindowHeight : '700'
        });
    </script>

    <button type="submit" class="btn btn-primary">Salvar</button>
    <button type="button" class="btn btn-danger" onclick="location.href='excluir.asp?tipo=1&id=<%=id%>'">Deletar</button>
    <button type="button" class="btn btn-default" onclick="location.href='javascript:history.back();'">Cancelar</button>
</form>


<%
elseif tipo="4" then
'**********************************************
'  ADD CLIENTE
'**********************************************
%>




<%
elseif tipo="5" then
'**********************************************
'  ADD CLIENTE
'**********************************************
%>


<%
end if
%>

</div><!--fecha bloco-->

<div style="height:50px;"></div>
</div>

<div class="footer">
<!--#include file="rodape.asp" -->
</div>

</body>
</html>
