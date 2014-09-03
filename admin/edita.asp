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
<meta http-equiv="Content-Type" content="text/html; charset=Iso-8859-1" />
<title><%=tituloHome%></title>
<link href="css/style_adm.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>

<link href="ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script src="ckeditor/_samples/sample.js" type="text/javascript"></script>

<script language="javascript">
var win = null;
function NovaJanela(pagina,nome,w,h,scroll){
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
	win = window.open(pagina,nome,settings);
}
</script>


</head>

<body onLoad="javascript:reiniciarContadorSessao();">


<div id="geral">

<div class="cabecalho">
<div class="logoMenor" onclick="location.href='admin.asp'"></div>

<div class="logoff"><!--#include file="topo.asp" --></div>

<div style="clear:both"></div>

</div>

<div class="menu">

<!--#include file="menu.asp" -->


</div>

<div class="corpo">

<%
if tipo="1" then
'**********************************************
'  EDITA 
'**********************************************

Set rsTratamento = Server.CreateObject("ADODB.Recordset")
rsTratamento.Open "select * from "&prefixoTabela&"tratamentos WHERE id="&id, Conexao

%>
<h1><%=rsTratamento("tratamento")%> - Esta&ccedil;&atilde;o Beleza</h1>
<p>Edição de conteúdo.</p>

<div class="desloca-esq" style="width:450px">
<form id="formCadastro" name="formCadastro" method="POST" action="edita.asp?tipo=3">
    <label for="txtNovidade">Descri&ccedil;&atilde;o</label>
    <textarea name="txtNovidade" id="txtNovidade" class="cx-form4"><%=rsTratamento("descricao")%></textarea>
    <script type="text/javascript">
    CKEDITOR.replace( 'txtNovidade' );
    </script>
    <input name="id" id="id" type="hidden" value="<%=id%>" />
    <br />
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td width="24%"><input type="image" src="images/botsalvar.jpg" name="button" id="button" value="Submit" /></td>
    <td width="76%"><a href="javascript:history.back();"><img src="images/botCancelar.jpg" width="100" height="26" alt="" /></a></td>
    </tr>
    </table>
</form>
</div>

<div class="desloca-dir" style="width:286px"><img src="<%=enderecoFotoTreinamentos%><%=rsTratamento("foto")%>" width="286" height="311" alt="" /></div>
<div class="clear"></div>
<%
rsTratamento.Close()
set rsTratamento = nothing
Conexao.Close()
set Conexao = nothing

elseif tipo="2" then


end if
%>

</div>

<div style="clear:both"></div>

<div class="rodape">
<!--#include file="rodape.asp" -->
</div>


</div>
 
 
 
</body>
</html>
