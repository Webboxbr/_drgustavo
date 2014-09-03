
<!--#include file="admin/conexao.asp" -->

<%
'captura as informações da página anterior'
id = request.querystring("id")
h = request.querystring("h")
n = request.querystring("n")

'verifica se o horario foi agendado'
'caso o horário já esteja ocupado o sistema redireciona para consultas.asp'
Set rsConfHorario = Server.CreateObject("ADODB.Recordset")
rsConfHorario.Open "select * from "&prefixoTabela&"reservas where id="&id, Conexao
if rsConfHorario("disp"&n)<>"s"then
response.redirect("consultas.asp")
end if

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

<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/styleConsultas.css">


<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jPages.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/github.css">

<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/highlight.pack.js"></script>
<script type="text/javascript" src="js/tabifier.js"></script>
<script src="js/js.js"></script>
<script src="js/jPages.js"></script>


<script>
  /* when document is ready */
  $(function(){

    /* initiciate jPages */
    $("div.holder").jPages({
      containerID : "itemContainer",
      animation   : "bounceInLeft",
      perPage: 6,
      previous    : "span.arrowPrev",
      next        : "span.arrowNext",
    });

  });
</script>
 

 	<title>Consultas</title>
</head>

<body>
	<section id="geral">		
	<!--#include file="_includes/header.asp"-->
		<section id="corpo">

			<div class="margens">

			<div class="desloca-esq" style="width:374px;">
				<span class="icone-verde calendario" style="margin-right:10px"></span>
				<h2 class="contato-dir verde" style="margin:0;">Agende</h2>
				<p class="contato-dir cinza-claro" style="margin:0;">sua Consulta</p>
				<div class="clearfix"></div>

				<div style="height:30px"></div>

				<p class="verde">Data escolhida</p>
				<div class="bloco-cinza t18 cinza negrito dataEscolhida">
					<%=diadasemana%> - <%=rsHorarios("dia")%>
				</div>

				<p class="verde">Horário escolhido</p>
				<div class="bloco-cinza t18 cinza negrito horaEscolhida">
					<%=rsHorarios("h"&n)%>h
				</div>


			</div>


			<div class="desloca-dir" style="width:674px;">
				<h3 class="t30 verde">Agora preencha o formulário</h3>
				<p class="semEsp">para concluir o agendamento</p>

				<div style="height:30px"></div>

				<form id="frmDados" name="frmDados" method="POST" action="add.asp">

					<input type="hidden" name="txtId" value="<%=id%>" />
					<input type="hidden" name="txtNumero" value="<%=n%>" />
					<input type="hidden" name="txtDiaSemana" value="<%=diadasemana%>" />
					<input type="hidden" name="txtDia" value="<%=rsHorarios("dia")%>" />
					<input type="hidden" name="txtHorario" value="<%=rsHorarios("h"&n)%>" />

					<label for="txtNome" class="verde">Nome<br />
    				<input type="text" class="form1" name="txtNome" id="txtNome" placeholder="Seu nome" /></label>

    				<label for="txtEmail" class="verde">E-mail<br />
    				<input type="text" class="form1" name="txtEmail" id="txtEmail" placeholder="seunome@provedor.com.br" /></label>

    				<label for="txtEmail2" class="verde">Confirme e-mail<br />
    				<input type="text" class="form1" name="txtEmail2" id="txtEmail2" placeholder="seunome@provedor.com.br" /></label>

    				<label for="txtTel" class="verde">Telefone<br />
    				<input type="text" class="form1" name="txtTel" id="txtTel" placeholder="00 0000-0000" /></label>

    				<label for="txtEnd" class="verde">Endereço<br />
    				<input type="text" class="form1" name="txtEnd" id="txtEnd" placeholder="Sua rua" /></label>

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

					<div class="desloca-esq" style="width:280px;"><input type="image" src="images/botAgenda.png" name="button" id="button" value="Submit" /></div>
					<div class="desloca-esq"><a href="cancelar.asp?id=<%=id%>&n=<%=n%>"><img src="images/botCancelar.png"></a></div>
					<div class="clearfix"></div>
					
				</form>
				

			</div>
			<div class="clearfix"></div>
        	<div style="height:30px"></div>

			</div>
			
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>		
</body>
</html>