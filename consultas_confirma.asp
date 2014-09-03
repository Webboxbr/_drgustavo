
<!--#include file="admin/conexao.asp" -->

<%
'captura as informações da página anterior'
dia 		= request.querystring("dia")
diaSemana	= request.querystring("ds")
horario		= request.querystring("h")
nome 		= request.querystring("n")
email		= request.querystring("e")
telefone	= request.querystring("t")
endereco	= request.querystring("en")
sexo		= request.querystring("s")
atendimento	= request.querystring("a")
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
				<span class="icone-verde calendario" style="margin-right:10px"></span>
				<h2 class="contato-dir verde" style="margin:0;">Confirmação de consulta</h2>
				<p class="contato-dir cinza-claro" style="margin:0;"></p>
				<div class="clearfix"></div>

				<div style="height:30px"></div>

				<div style='-webkit-border-radius: 10px;-moz-border-radius: 10px;	border-radius: 10px;background-color:#EDEDED;padding:39px;'><p style='font-size:30px;font-family: 'Arial', sans-serif;color:#595959;'>Ol&aacute;, <%=nome%>,<br>você tem uma consulta pré-marcada com o <b>Dr. Gustavo Abreu</b>, conforme informações abaixo:</p><hr style='height:1px;border-bottom:solid 1px #ccc;border-top:none;border-left:none;border-right:none;'><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#A0A0A0;'><%=nome%><br><%=email%><br><%=telefone%><br><%=endereco%><br><%=sexo%><br><%=atendimento%><br></p>

				<p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'><%=diaSemana%></p><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'><%=dia%></p><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'><%=horario%></p><hr style='height:1px;border-bottom:solid 1px #ccc;border-top:none;border-left:none;border-right:none;'><p style='font-size:20px;font-family: 'Arial', sans-serif;color:#595959;'><b>Aguarde o contato telef&ocirc;nico do consult&oacute;rio confirmando a consulta.</b><br />Anote o endere&ccedil;o e o telefone. Em caso de altera&ccedil;&atilde;o, favor comunicar o m&eacute;dico com at&eacute; 24 horas de anteced&ecirc;ncia.</p>

				<p style='font-size:20px;font-family: 'Arial', sans-serif;color:#595959;'><span style='color:#97B700;'>(19) 3231-5119  -  3232.5866</span><br>Avenida Andrade Neves, 683<br>CEP 13013-161 - Campinas - SP</p><img src='http://www.webox.com.br/clientes/drgustavo/images/email/mapa.jpg'></div>		


			
			<div class="clearfix"></div>
        	<div style="height:30px"></div>

			</div>
			
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>		
</body>
</html>