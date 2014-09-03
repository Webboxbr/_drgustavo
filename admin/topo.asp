<%
nome		=	session("user")

Dim diaAtual, mesAtual, anoAtual, horaAtual, minutoAtual
diaAtual = Day(Date())
mesAtual = MonthName(Month(Date()))
anoAtual = Year(Date())
horaAtual = Hour(Time())
minutoAtual = Minute(Time())
%>

<div id="logoutSistema">Ol&aacute; <strong><%=nome%></strong>,<br>
Este login foi iniciado em: <%=diaAtual%> de <%=mesAtual%> de <%=anoAtual%> &agrave;s <%=horaAtual%>:<%=minutoAtual%> <img src="images/icone_hora.png" alt="" style="margin-bottom:-5px;"> <span id="contadorSessao"></span></div>
<div class="desloca-dir aling-dir" style="margin-top:25px;margin-right:24px;"><button type="button" class="btn btn-default" onclick="location.href='logoff.asp'">Sair</button></div>
<span class="clear"></span>
