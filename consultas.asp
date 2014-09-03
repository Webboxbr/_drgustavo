<!--#include file="admin/conexao.asp" -->

<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/styleConsultas.css">


<title>Dr. Gustavo Abreu | Oftalmologista - consultas</title>
<meta name="author" content="Webbox" />
<meta name="description" content="Agende a sua consulta com o Médico Oftalmologista Dr. Gustavo Abreu online, selecionando a data e a hora de sua preferência." />
<meta name="keywords" content="Consulta Dr. Gustavo Abreu, consulta oftalmologista, consulta oftalmologista Campinas, agendar consulta Dr. Gustavo Abreu, horários Dr. Gustavo Abreu." />


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
 



</head>


<%
dataAtual = date()

'encontra a semana corrente campo --semana-- da base que inicia na semana 1 dia 09/06/2014'
Set rsSemana = Server.CreateObject("ADODB.Recordset")
rsSemana.Open "select semana, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where semana<>'n' and dia='"&dataAtual&"'", Conexao


'sendo final de semana, subtrai dois dias'
if rsSemana.eof=true then
	dataAtual=cdate(dataAtual-2)
	Set rsSemana = Server.CreateObject("ADODB.Recordset")
	rsSemana.Open "select semana, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where semana<>'n' and dia='"&dataAtual&"'", Conexao
end if
%>

<body>


<%

'if rsSemana.eof=false then
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select * from "&prefixoTabela&"reservas where semana>="&rsSemana("semana")&" order by id asc limit 30", Conexao

arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")

%>
	<section id="geral">

	<!--#include file="_includes/header.asp"-->
		<section id="corpo">

			<div class="margens">
				<div class="desloca-esq">
					<span class="icone-verde calendario" style="margin-right:10px"></span>
					<h2 class="contato-dir verde" style="margin:0;">Agende</h2>
					<p class="contato-dir cinza-claro" style="margin:0;">sua Consulta</p>
					<div class="clearfix"></div>
				</div>
				<div class="desloca-dir"><a href="#ajuda"><img src="images/botAjuda.jpg" alt=""></a></div>
				<div class="clearfix"></div>

				<div style="height:30px"></div>

			<div id="bloco">	
				<!-- navigation holder -->
        		<div class="holder"></div>

        		<!-- wrapped custom buttons for easier styling -->
			    <div class="customBtns">
			      <span class="arrowPrev"></span>
				  <span class="arrowNext"></span>
				  <span class="legenda"></span>
			    </div>

        		<!-- item container -->
        		<ul id="itemContainer">
					<%
					contador=1
					while not rsHorarios.eof
					diaSem=int(rsHorarios("diaSemana"))
					diadasemana = arrayDS(weekday((diaSem)-1))

					'construindo data'
					diaMes = cdate(rsHorarios("dia"))
					diaFinal= diaMes+4
					myarray = split(diaMes,"/")
					strMes = myarray(1)

					strMes = strMes
					Select Case strMes
					Case 1 : strMes = "Janeiro"
					Case 2 : strMes = "Fevereiro"
					Case 3 : strMes = "Março"
					Case 4 : strMes = "Abril"
					Case 5 : strMes = "Maio"
					Case 6 : strMes = "Junho"
					Case 7 : strMes = "Julho"
					Case 8 : strMes = "Agosto"
					Case 9 : strMes = "Setembro"
					Case 10 : strMes = "Outubro"
					Case 11 : strMes = "Novembro"
					Case 12 : strMes = "Dezembro"
					End Select

					hoje = date()


					'response.write("Dia Mês="&diaMes&" - Hoje="&hoje)

					'diaMes = int(rsHorarios("diaMes"))


						if contador <> 5 then
						%>

							<li>
								<p><%=diadasemana%></p>
								<p class="negrito"><%=diaMes%></p>

								<% 
								for nrep=1 to 17
								if diaMes < hoje then %>
								<p class="inativo"><%=rsHorarios("h"&nrep)%></p>
								<% else %>
									<% if rsHorarios("disp"&nrep)="s" then %>
									<a href="consultas_comp.asp?id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="<%=rsHorarios("disp"&nrep)%>"><%=rsHorarios("h"&nrep)%></a>
									<% elseif rsHorarios("disp"&nrep)="n" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="a" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="c" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="i" then %>
									<p class="i"><%=rsHorarios("h"&nrep)%></p>
									<% end if %>
								<% end if 
								next
								%>								
							</li>

							<%
							if contador=1 then
							%>
							<li class="topo">
								<p class="txtMes negrito"><%=strMes%></p>
								<p>Semana de <%=diaMes%> à <%=diaFinal%></p>
								<p class="t15 laranja">Ocasionalmente alguns horários podem sofrer atraso devido aos diferentes graus de complexidade de cada consulta</p>
							</li>
							<%
							end if
							%>

						<%
						else
						contador=0
						%>

							<li class="sem-borda">
								<p><%=diadasemana%></p>
								<p class="negrito"><%=diaMes%></p>

								<%
								for nrep=1 to 17
								if diaMes < hoje then %>
								<p class="inativo"><%=rsHorarios("h"&nrep)%></p>
								<% else %>
									<% if rsHorarios("disp"&nrep)="s" then %>
									<a href="consultas_comp.asp?id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="<%=rsHorarios("disp"&nrep)%>"><%=rsHorarios("h"&nrep)%></a>
									<% elseif rsHorarios("disp"&nrep)="n" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="a" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="c" then %>
									<p class="n"><%=rsHorarios("h"&nrep)%></p>
									<% elseif rsHorarios("disp"&nrep)="i" then %>
									<p class="i"><%=rsHorarios("h"&nrep)%></p>
									<% end if %>
								<% end if
								next
								%>								
							</li>

						<%
						end if

					rsHorarios.MoveNext()
					contador=contador+1

					wend

					rsHorarios.Close()
					set rsHorarios = nothing
					Conexao.Close()
					%>
					<div class="clearfix"></div>
        		</ul>
        		<div class="clearfix"></div>

        		<div style="height:30px"></div>

        		<h3 class="t30 verde" id="ajuda">Como agendar sua consulta?</h3>
				<p class="semEsp">Siga o passo a passo e agende em 5 minutos</p>
				<div class="como_agendar"></div>
			</div><!--fecha bloco-->	



			</div>

		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>	

<script>
	$("#bloco").css("display", "block");
</script> 
</body>
</html>