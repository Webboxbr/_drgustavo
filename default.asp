<!--#include file="admin/conexao.asp" -->

<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">

<title>Dr. Gustavo Abreu | Oftalmologista - doenças oculares</title>
<meta name="author" content="Webbox" />
<meta name="description" content="Doutor Gustavo Abreu é Médico Oftalmologista especializado em doenças externas oculares, córnea, catarata, glaucoma e outras. Agende sua consulta." />
<meta name="keywords" content="Oftalmologista, oftalmologia, oftalmologista Campinas, médico oftalmologista, médico oftalmologista Campinas, doenças oculares, doenças córnea, catarata, cirurgia refrativa, cirurgia retina, úvea, glaucoma, ultrassonografia, cirurgia olhos, deslocamento retina, deslocamento vítreo, laser retina, retinopexia, inflamação ocular, ultrassonografia, ultrassonografia olhos" />


</head>
<body>

<%
dataAtual = date()

arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")

'encontra a semana corrente campo --semana-- da base que inicia na semana 1 dia 09/06/2014'
Set rsSemana = Server.CreateObject("ADODB.Recordset")
rsSemana.Open "select semana, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where semana<>'n' and dia='"&dataAtual&"' limit 2", Conexao


'confere que dia é hoje'
	txtHoje=date()
	diadasemanaHoje = weekday(txtHoje)


'sendo final de semana, subtrai dois dias'
if rsSemana.eof=true then	
	if diadasemanaHoje=7 then		
		dataAtual=cdate(dataAtual+2)
		dia1=dataAtual
		dia2=dataAtual+1
	elseif diadasemanaHoje=1 then
		dataAtual=cdate(dataAtual+1)
		dia1=dataAtual
		dia2=dataAtual+1
	end if

	Set rsSemana = Server.CreateObject("ADODB.Recordset")
	rsSemana.Open "select semana, STR_TO_DATE(dia,'%d/%m/%Y') as dia from "&prefixoTabela&"reservas where semana<>'n' and dia='"&dataAtual&"' limit 2", Conexao

else
dia1=dataAtual
dia2=dataAtual+1
end if



%>

	<section id="geral">

	<!--#include file="_includes/header.asp"-->

		<section id="corpo">
			<ul class="corpo-home">
				<li class="altura">
					<span class="icone-azul visao"></span>
					<h2>Especialidades</h2>
					<p>Dr. Gustavo Abreu</p>
					<div class="clearfix"></div>
					<img src="images/fotohome.jpg" alt="Dr Gustavo Abreu" class="drGustavo">
					<div class="clearfix"></div>
					<p><span class="negrito">Dr. Gustavo Abreu</span> é Médico Oftalmologista, especializado em doenças externas oculares, córnea, catarata, cirurgia refrativa, úvea, retina, glaucoma e ultrassonografia.</p>
				</li>
				<li class="altura">
					<a href="trabalhos.asp">
						<span class="icone-azul livro"></span>
						<h2>Livros</h2>
						<p>Publicados</p>
					</a>
					<div class="clearfix"></div>
					<img src="images/livro.jpg">
					<p>Autor: Dr. Gustavo Abreu <span class="negrito">Ultra-Sonografia Ocular: atlas & texto.</span> 4ª edição. </p>
					<div class="clearfix"></div>

					<img src="images/livros/2.jpg">
					<p>Co-autor: Dr. Gustavo Abreu <b>Ultra-Sonografia Ocular: atlas & texto.</b> 3ª edição.<br>
						<a href="trabalhos.asp">Ver mais</a>
					</p>
				</li>
				<li>
					<a href="consultas.asp">
						<span class="icone-verde calendario"></span>
						<h2>Agende</h2>
						<p>Sua Consulta</p>
					</a>					
					<div class="clearfix"></div>


					
					<div class="quadro-da-agenda">
						<a href="consultas.asp" class="link-veja-mais-home desloca-dir aling-dir">Veja mais datas disponíveis</a>
						<div class="clearfix"></div>







		<ol class="dia-semana">

			<li class="com-borda">

			<%
			Set rsHorariosDia1 = Server.CreateObject("ADODB.Recordset")
			rsHorariosDia1.Open "select * from "&prefixoTabela&"reservas where semana>="&rsSemana("semana")&" and dia='"&dia1&"' order by id asc limit 1", Conexao

			diaSem=int(rsHorariosDia1("diaSemana"))
			diadasemana = arrayDS(weekday((diaSem)-1))

			'construindo data'
			diaMes = cdate(rsHorariosDia1("dia"))
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
			%>

				<p class="t18"><%=diadasemana%><br>
				<span class="t25"><%=diaMes%></span></p>

				<ol id="itemContainer">
				<%			

					while not rsHorariosDia1.eof


				for nrep=1 to 17
				if diaMes < hoje then %>
				<li class="inativo"><%=rsHorariosDia1("h"&nrep)%></li>
				<% else %>
					<% if rsHorariosDia1("disp"&nrep)="s" then %>
					<li><a class="s" href="consultas_comp.asp?id=<%=rsHorariosDia1("id")%>&h=<%=rsHorariosDia1("h"&nrep)%>&n=<%=nrep%>"><%=rsHorariosDia1("h"&nrep)%></a></li>
					<% elseif rsHorariosDia1("disp"&nrep)="n" then %>
					<li><p class="n"><%=rsHorariosDia1("h"&nrep)%></p></li>
					<% elseif rsHorariosDia1("disp"&nrep)="a" then %>
					<li><p class="n"><%=rsHorariosDia1("h"&nrep)%></p></li>
					<% elseif rsHorariosDia1("disp"&nrep)="c" then %>
					<li><p class="n"><%=rsHorariosDia1("h"&nrep)%></p></li>
					<% elseif rsHorariosDia1("disp"&nrep)="i" then %>
					<li><p class="i"><%=rsHorariosDia1("h"&nrep)%></p></li>
					<% end if %>
				<% end if 
				next

				rsHorariosDia1.MoveNext()
				wend

				rsHorariosDia1.Close()
				set rsHorariosDia1 = nothing
				%>
				</ol>

			</li>







			<li>
			<%
			Set rsHorariosDia2 = Server.CreateObject("ADODB.Recordset")
			rsHorariosDia2.Open "select * from "&prefixoTabela&"reservas where semana>="&rsSemana("semana")&" and dia='"&dia2&"' order by id asc limit 1", Conexao

			'response.write(rsHorariosDia2("diaSemana"))
			'response.end()

			if rsHorariosDia2.eof=true then
				dia2=dia2+2

				Set rsHorariosDia2 = Server.CreateObject("ADODB.Recordset")
				rsHorariosDia2.Open "select * from "&prefixoTabela&"reservas where semana>="&rsSemana("semana")&" and dia='"&dia2&"' order by id asc limit 1", Conexao

				diaSem=int(rsHorariosDia2("diaSemana"))
				diadasemana = arrayDS(weekday((diaSem)-1))
			else

				diaSem=int(rsHorariosDia2("diaSemana"))
				diadasemana = arrayDS(weekday((diaSem)-1))

			end if

			'construindo data'
			diaMes = cdate(rsHorariosDia2("dia"))
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
			%>
				<p class="t18"><%=diadasemana%><br>
				<span class="t25"><%=diaMes%></span></p>

				<ol id="itemContainer">
				<%			

					while not rsHorariosDia2.eof


				for nrep=1 to 17
				if diaMes < hoje then %>
				<li class="inativo"><%=rsHorariosDia2("h"&nrep)%></li>
				<% else %>
					<% if rsHorariosDia2("disp"&nrep)="s" then %>
					<li><a class="s" href="consultas_comp.asp?id=<%=rsHorariosDia2("id")%>&h=<%=rsHorariosDia2("h"&nrep)%>&n=<%=nrep%>"><%=rsHorariosDia2("h"&nrep)%></a></li>
					<% elseif rsHorariosDia2("disp"&nrep)="n" then %>
					<li><p class="n"><%=rsHorariosDia2("h"&nrep)%></p></li>
					<% elseif rsHorariosDia2("disp"&nrep)="a" then %>
					<li><p class="n"><%=rsHorariosDia2("h"&nrep)%></p></li>
					<% elseif rsHorariosDia2("disp"&nrep)="c" then %>
					<li><p class="n"><%=rsHorariosDia2("h"&nrep)%></p></li>
					<% elseif rsHorariosDia2("disp"&nrep)="i" then %>
					<li><p class="i"><%=rsHorariosDia2("h"&nrep)%></p></li>
					<% end if %>
				<% end if 
				next

				rsHorariosDia2.MoveNext()
				wend

				rsHorariosDia2.Close()
				set rsHorariosDia2 = nothing
				%>
				</ol>								
			</li>




		</ol>










					</div>			
					<div class="clearfix"></div>
				</li>
			</ul>
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>	
 	
</body>
</html>