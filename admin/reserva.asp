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



<link href="css/styleConsultas.css" rel="stylesheet" type="text/css" />



<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>
<script src="js/mascaras.js"></script>
<script src="assets/js/bootstrap.js"></script>
</head>

<%
'recupera dados da página anterior consultas.asp'
tipo	= request.querystring("tipo")
id 		= request.querystring("id")
h 		= request.querystring("h")
n 		= request.querystring("n")


%>

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
<div style="height:30px;"></div>



<%
if tipo="conf" then

'marca o horário como ocupado'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&n&"='a' WHERE id="&id
updateRs.open editSQL, Conexao

'recupera item pelo id'
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select * from "&prefixoTabela&"reservas where id="&id, Conexao

diaSem=int(rsHorarios("diaSemana"))
arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")
diadasemana = arrayDS(weekday((diaSem)-1))

%>
	<div class="box-cinza">		
		<div class="desloca-esq">
			<p>Se deseja bloquear o horário (<%=h%>) do dia <%=rsHorarios("dia")%><br> Clique no botão abaixo:</p>
			<button type="button" class="btn btn-primary" onclick="location.href='bloquear.asp?id=<%=id%>&disp=<%=n%>'">Bloquear (<%=h%>) do dia <%=rsHorarios("dia")%></button>
		</div>
		<div class="desloca-dir">
		<p>Se deseja agendar o horário (<%=h%>) do dia <%=rsHorarios("dia")%> preencha o formulário abaixo:</p>

			<form id="frmDados" name="frmDados" method="POST" action="add.asp?tipo=1">
				<input type="hidden" name="txtId" value="<%=id%>" />
				<input type="hidden" name="txtNumero" value="<%=n%>" />
				<input type="hidden" name="txtDiaSemana" value="<%=diadasemana%>" />
				<input type="hidden" name="txtHorario" value="<%=rsHorarios("dia")%>" />

				<label for="txtNome" class="verde">Nome<br />
				<input type="text" class="form1" name="txtNome" id="txtNome" placeholder="Nome do paciente" /></label>

				<label for="txtEmail" class="verde">E-mail<br />
				<input type="text" class="form1" name="txtEmail" id="txtEmail" placeholder="email@provedor.com.br" /></label>

				<label for="txtEmail2" class="verde">Confirme e-mail<br />
				<input type="text" class="form1" name="txtEmail2" id="txtEmail2" placeholder="email@provedor.com.br" /></label>

				<label for="txtTel" class="verde">Telefone<br />
				<input type="text" class="form1" name="txtTel" id="txtTel" placeholder="00 0000-0000" /></label>

				<label for="txtEnd" class="verde">Endereço<br />
				<input type="text" class="form1" name="txtEnd" id="txtEnd" placeholder="Endereço do paciente" /></label>

				<label for="txtSexo" class="verde">Sexo<br />
				<select name="txtSexo" class="form2" id="txtSexo">
				    <option value="Masculino" selected="selected">Masculino</option>
				    <option value="Feminino">Feminino</option>
				</select>
				</label>

				<label for="txtAtendimento" class="verde">Atendimento via convênio ou particular<br />
				<select name="txtAtendimento" class="form2" id="txtAtendimento">
				    <option value="Particular" selected="selected">Particular</option>
				    <option value="Convênio">Convênio</option>
				</select>
				</label>
				<div style="height:30px"></div>

				<div class="desloca-esq" style="width:280px;"><input type="image" src="../images/botAgenda.png" name="button" id="button" value="Submit" /></div>
				<div class="desloca-esq"><a href="cancelar.asp?id=<%=id%>&n=<%=n%>"><img src="../images/botCancelar.png"></a></div>
				<div class="clear"></div>				
			</form>
		</div>
		<div class="clear"></div>
	</div>
<%
elseif tipo="add" then

'recupera item pelo id'
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select * from "&prefixoTabela&"reservas where id="&id, Conexao

diaSem=int(rsHorarios("diaSemana"))
arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")
diadasemana = arrayDS(weekday((diaSem)-1))

%>
	<div class="box-cinza">
		<%
		if rsHorarios("confirma"&n)="s" then
		%>
		<div class="alert alert-success text-center"><b>A reserva já está confirmada!</b></div>
		<%
		end if
		%>
		<div class="desloca-esq" style="width:490px">
			<p>Existe uma reserva para o horário (<%=h%>) do dia <%=rsHorarios("dia")%><br> Veja os dados do paciente ao lado:</p>
			<button type="button" class="btn btn-success" onclick="location.href='confirmar.asp?id=<%=id%>&n=<%=n%>'">Confirmar a consulta</button>
			<button type="button" class="btn btn-danger" onclick="location.href='cancelar.asp?id=<%=id%>&n=<%=n%>'">Apagar a reserva</button>
			<button type="button" class="btn btn-default" onclick="location.href='javascript:history.back();'">Voltar para Consultas</button>
		</div>
		<div class="desloca-dir" style="width:600px">
		<p>Dados do paciente:</p>

		<div class="alert alert-info"><b>Nome:</b> <%=rsHorarios("nome"&n)%></div>
		<div class="alert alert-info"><b>E-mail:</b> <%=rsHorarios("email"&n)%></div>
		<div class="alert alert-info"><b>Telefone:</b> <%=rsHorarios("telefone"&n)%></div>
		<div class="alert alert-info"><b>Endereço:</b> <%=rsHorarios("end"&n)%></div>
		<div class="alert alert-info"><b>Sexo:</b> <%=rsHorarios("sexo"&n)%></div>
		<div class="alert alert-info"><b>Atendimento:</b> <%=rsHorarios("atendimento"&n)%></div>


		</div>
		<div class="clear"></div>
	</div>
<%
elseif tipo="desb" then

'recupera item pelo id'
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select * from "&prefixoTabela&"reservas where id="&id, Conexao

diaSem=int(rsHorarios("diaSemana"))
arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")
diadasemana = arrayDS(weekday((diaSem)-1))
%>
	<div class="box-cinza">		
			<p>O horário (<%=h%>) do dia <%=rsHorarios("dia")%>, atualmente está bloqueado:</p>
			<button type="button" class="btn btn-success" onclick="location.href='cancelar.asp?id=<%=id%>&n=<%=n%>'">Desbloquear horário</button>
			<button type="button" class="btn btn-default" onclick="location.href='javascript:history.back();'">Voltar para Consultas</button>
	</div>
<%
end if
%>



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
