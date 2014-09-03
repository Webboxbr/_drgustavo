<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<%
tipo		= request.QueryString("tipo")
id			= request("id")
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


	<style type="text/css" title="currentStyle">
    @import "css/demo_page.css";
    @import "css/jquery.dataTables.css";
    </style>
    <script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="js/euDateFormat.js"></script>

	<script type="text/javascript" charset="utf-8">
        $(document).ready(function() {
            $('#example').dataTable();


            //ordenado por data - o plugin euDateFormat.js é necessário para a ordenação funcionar corretamente
			$('#tabelaconsultas').dataTable( {
				"iDisplayLength": 17,		
	        	"bPaginate": true,
	        	"aoColumns": [{ "sType": "eu_date" }, null, null, null, null, null ],
	        	"oLanguage": {
			           "sLengthMenu": 'Display <select>'+
			            '<option value="17">17</option>'+
			            '<option value="20">20</option>'+
			            '<option value="30">30</option>'+
			            '<option value="40">40</option>'+
			            '<option value="50">50</option>'+
			            '</select> records'
			        },
			} );


        } );  

    </script>


<script TYPE="text/javascript">
	<!–
		function submitenter(myfield,e)
		{
			var keycode;
			if (window.event) keycode = window.event.keyCode;
			else if (e) keycode = e.which;
			else return true;

			if (keycode == 13)
			{
			myfield.form.submit();
			return false;
			}
			else
			return true;
		}
	//–>
</script>

<script>
	var basePath = 'lista.asp?tipo=3';  // aqui eh a base da pagina
	window.onload = function(){
	    document.getElementById('data').onchange = function(){
	        window.location = basePath + '&data=' + this.value;
	    }
	}
</script>


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
'  LISTA DE CLIENTES
'**********************************************
%>
<h1 class="desloca-esq">LISTA DE CLIENTES</h1>
<div class="desloca-dir"><a href="novo.asp?tipo=1"><img src="images/botAdd.jpg" width="100" height="26" alt="Incluir Cliente" /></a></div>
<div class="clear"></div>

<%
Set rsClientes = Server.CreateObject("ADODB.Recordset")
rsClientes.Open "select * from "&prefixoTabela&"clientes order by nome asc", Conexao
%>

<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
	<thead>
		<tr>
			<th>Nome</th>
			<th></th>
		</tr>
	</thead>
    <tbody>
<%
while not rsClientes.eof
%>    
	
		<tr class="gradeA">
			<td><a href="novo.asp?tipo=4&id=<%=rsClientes("id")%>" class="azul"><%=rsClientes("nome")%></a></td>
			<td><a href="novo.asp?tipo=3&id=<%=rsClientes("id")%>" class="azul">Cliente Ativo</a></td>
		</tr>
	
<%
rsClientes.MoveNext()
wend

rsClientes.Close()
set rsClientes = nothing
Conexao.Close()
%>     
	</tbody>
	<tfoot>
		<tr>
			<th>Nome</th>
			<th></th>
		</tr>
	</tfoot>
</table>








<%
elseif tipo="2" then
'**********************************************
'  LISTA DE PROJETOS
'**********************************************
%>


<div class="desloca-esq">
<p class="semEsp azul-2 t30">Lista Trabalhos</p>
<p class="semEsp cinza t15">Ipsum lorem vortex manute et lupus et vortex lorem.</p>
</div>
<div class="desloca-dir"><button type="submit" class="btn btn-primary" onclick="location.href='novo.asp?tipo=2'">Incluir Novo</button></div>
<div class="clear"></div>
<div style="height:30px;"></div>


<%
Set rsTrabalhos = Server.CreateObject("ADODB.Recordset")
rsTrabalhos.Open "select * from "&prefixoTabela&"trabalhos where ativa<>'n' order by titulo asc", Conexao
%>

<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
	<thead>
		<tr>
			<th>Título</th>
		</tr>
	</thead>
    <tbody>
<%
while not rsTrabalhos.eof
%>    
	
		<tr class="gradeA">
			<td><a href="novo.asp?tipo=3&id=<%=rsTrabalhos("id")%>" class="azul"><%=rsTrabalhos("titulo")%></a></td>
		</tr>
	
<%
rsTrabalhos.MoveNext()
wend

rsTrabalhos.Close()
set rsTrabalhos = nothing
Conexao.Close()
%>     
	</tbody>
	<tfoot>
		<tr>
			<th>Título</th>
		</tr>
	</tfoot>
</table>

<%
elseif tipo="3" then
'**********************************************
'  LISTA DE PROXIMAS CONSULTAS
'**********************************************
%>

<div class="desloca-esq">
<p class="semEsp azul-2 t30">Listagem das consultas</p>
<p class="semEsp cinza t15"></p>
</div>
<div class="desloca-dir"><button type="submit" class="btn btn-primary" onclick="location.href='update.asp?tipo=2'">Limpar todos horários sem informações</button></div>
<div class="clear"></div>
<div style="height:30px;"></div>


<%
'recupera data atual'
dataAtual = date()
'cria um array com a data atual'
myArrayData = split(dataAtual,"/")
dia = myArrayData(0) 'myArrayData[0] = dia'
mes = myArrayData(1) 'myArrayData[1] = mês'
ano = myArrayData(2) 'myArrayData[2] = ano'


'Caso os campos de data sejam usados'
data=request("txtData")
data1=request("data")
if data<>"" or data1<>"" then
	if data="" then
	data = data1
	end if

	myArrayData = split(data,"/")
	dia = myArrayData(0) 'myArrayData[0] = dia'
	mes = myArrayData(1) 'myArrayData[1] = mês'
	ano = myArrayData(2) 'myArrayData[2] = ano'

end if


'faz o select com where ano, mes e dia'
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select id, dia, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, nome1, nome2, nome3, nome4, nome5, nome6, nome7, nome8, nome9, nome10, nome11, nome12, nome13, nome14, nome15, nome16, nome17, telefone1, telefone2, telefone3, telefone4, telefone5, telefone6, telefone7, telefone8, telefone9, telefone10, telefone11, telefone12, telefone13, telefone14, telefone15, telefone16, telefone17, disp1, disp2, disp3, disp4, disp5, disp6, disp7, disp8, disp9, disp10, disp11, disp12, disp13, disp14, disp15, disp16, disp17, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where y>="&ano&" and m>="&mes&" and d>="&dia&" and h1<>'' order by dia asc limit 30", Conexao
%>

<div class="container">
	<div class="row">
		<div class="col-md-3">
			<form action="lista.asp?tipo=3" method="post" name="form">
				<label for="txtData">Data <small>dd/mm/aaaa</small><br />
				<input type="text" name="txtData" id="txtData" class="form-control" onfocus="limpar(this);" onblur="escrever(this);" onKeyPress="Mascara(this,Data); return submitenter(this,event);" onKeyDown="Mascara(this,Data);" onKeyUp="Mascara(this,Data);" maxlength="10" /></label>
			</form>			
		</div>
		<div class="col-md-3">			
			<form action="lista.asp?tipo=3" method="post" name="form">
				<label for="txtData">Data <br />
					<select id="data"  class="form-control">
					    <option>Selecione uma data</option>
					    <%
					    Set rsReservas = Server.CreateObject("ADODB.Recordset")
						rsReservas.Open "select h1, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where h1<>'' order by dia asc", Conexao
					    
						while not rsReservas.eof
					    %>
					    	<option value="<%=rsReservas("dia")%>"><%=rsReservas("dia")%></option>
					    <%
						rsReservas.MoveNext()
						wend
					    %>
					</select>				
				</label>
				<br><a href="lista.asp?tipo=3">Mostrar horários a partir de hoje</a>
			</form>	
		</div>
		<div class="col-md-3">
			<img src="../images/legenda3.png" alt="">
		</div>
	</div>
</div>


<div style="height:50px"></div>




<table cellpadding="0" cellspacing="0" border="0" class="display" id="tabelaconsultas" width="100%">
	<thead>
		<tr>
			<th>Data</th>
			<th>Hora</th>
			<th>Nome</th>
			<th>Telefone</th>
			<th width="140px">Status</th>
			<th width="80px">Edição</th>
		</tr>
	</thead>
    <tbody>
<%
while not rsHorarios.eof


%>    
		<%
		for a=1 to 17
		%>
		<tr class="gradeA">
			<td><%=rsHorarios("dia")%></td>
			<td><%=rsHorarios("h"&a)%></td>
			<td><%=rsHorarios("nome"&a)%></td>
			<td><%=rsHorarios("telefone"&a)%></td>
			<td>
				<%
				if rsHorarios("disp"&a)="s" then
					response.write("<span class='bg-s'>Disponível</span>")
				elseif rsHorarios("disp"&a)="n" then
					response.write("<span class='bg-n'>Indisponível</span>")
				elseif rsHorarios("disp"&a)="i" then
					response.write("<span class='bg-i'>Bloqueado</span>")
				elseif rsHorarios("disp"&a)="a" then
					response.write("<span class='bg-a'>Faltam informações</span>")
				elseif rsHorarios("disp"&a)="c" then
					response.write("<span class='bg-c'>Confirmado</span>")
				end if
				%>
			</td>
			<td>

				<%
				if rsHorarios("disp"&a)="s" then
					%>
					<a class="btn btn-primary btn-sm" href="reserva.asp?tipo=conf&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&a)%>&n=<%=a%>">Editar</a>
					<%
				elseif rsHorarios("disp"&a)="n" then
					%>
					<a class="btn btn-primary btn-sm" href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&a)%>&n=<%=a%>">Editar</a>
					<%
				elseif rsHorarios("disp"&a)="i" then
					%>
					<a class="btn btn-primary btn-sm" href="reserva.asp?tipo=desb&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&a)%>&n=<%=a%>">Editar</a>
					<%
				elseif rsHorarios("disp"&a)="a" then
					%>
					<a class="btn btn-primary btn-sm" href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&a)%>&n=<%=a%>">Editar</a>
					<%
				elseif rsHorarios("disp"&a)="c" then
					%>
					<a class="btn btn-primary btn-sm" href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&a)%>&n=<%=a%>">Editar</a>
					<%
				end if
				%>
			</td>
		</tr>
		<%
		next
		%>
	
<%


rsHorarios.MoveNext()
wend

rsHorarios.Close()
set rsHorarios = nothing
Conexao.Close()
%>     
	</tbody>
	<tfoot>
		<tr>
			<th>Data</th>
			<th>Hora</th>
			<th>Nome</th>
			<th>Telefone</th>
			<th>Status</th>
			<th>Edição</th>
		</tr>
	</tfoot>
</table>




<%
elseif tipo="3" then
'**********************************************
'  LISTA DE CONSULTAS ANTERIORES
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
