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


<link rel="stylesheet" href="../css/jPages.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/github.css">




<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/highlight.pack.js"></script>
<script type="text/javascript" src="../js/tabifier.js"></script>
<script src="../js/js.js"></script>
<script src="../js/jPages.js"></script>

<link href="css/styleConsultas.css" rel="stylesheet" type="text/css" />


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



<script language="JavaScript" type="text/javascript" src="js/secao.js"></script>
<script src="js/mascaras.js"></script>
<script src="assets/js/bootstrap.js"></script>
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

<body onLoad="javascript:reiniciarContadorSessao();">

<%

'if rsSemana.eof=false then
Set rsHorarios = Server.CreateObject("ADODB.Recordset")
rsHorarios.Open "select * from "&prefixoTabela&"reservas where semana>="&rsSemana("semana")&" order by id asc limit 30", Conexao

arrayDS = array("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")

%>

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

			<p class="semEsp azul-2 t30">Consultas / Agendamentos</p>
			<p class="semEsp cinza t15">Confira os agendamentos realizados, confirmando ou cancelando o evento.</p>
			<div style="height:50px;"></div>

				<!-- navigation holder -->
        		<div class="holder"></div>

        		<!-- wrapped custom buttons for easier styling -->
			    <div class="customBtns">
			      <span class="arrowPrev"></span>
				  <span class="arrowNext"></span>
				  <span class="legenda2"></span>
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
			<% if rsHorarios("disp"&nrep)="s" then %>
			<a href="reserva.asp?tipo=conf&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="s-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="n" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="n-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="i" then %>
			<a href="reserva.asp?tipo=desb&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="i-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="a" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="a-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="c" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="c-2"><%=rsHorarios("h"&nrep)%></a>
			<% end if %>
		<% else %>
			<% if rsHorarios("disp"&nrep)="s" then %>
			<a href="reserva.asp?tipo=conf&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="s"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="n" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="n"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="i" then %>
			<a href="reserva.asp?tipo=desb&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="i"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="a" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="a"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="c" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="c"><%=rsHorarios("h"&nrep)%></a>
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
			<% if rsHorarios("disp"&nrep)="s" then %>
			<a href="reserva.asp?tipo=conf&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="s-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="n" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="n-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="i" then %>
			<a href="reserva.asp?tipo=desb&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="i-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="a" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="a-2"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="c" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="c-2"><%=rsHorarios("h"&nrep)%></a>
			<% end if %>
		<% else %>
			<% if rsHorarios("disp"&nrep)="s" then %>
			<a href="reserva.asp?tipo=conf&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="s"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="n" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="n"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="i" then %>
			<a href="reserva.asp?tipo=desb&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="i"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="a" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="a"><%=rsHorarios("h"&nrep)%></a>
			<% elseif rsHorarios("disp"&nrep)="c" then %>
			<a href="reserva.asp?tipo=add&id=<%=rsHorarios("id")%>&h=<%=rsHorarios("h"&nrep)%>&n=<%=nrep%>" class="c"><%=rsHorarios("h"&nrep)%></a>
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
        		
			</div><!--fecha bloco-->


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