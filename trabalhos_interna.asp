<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="admin/conexao.asp" -->
<%
id = request("id")
%>
<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">

<title>Dr. Gustavo Abreu | Oftalmologista - formação</title>
<meta name="author" content="Webbox" />
<meta name="description" content="Doutor Gustavo Abreu é Médico Oftalmologista especializado em doenças externas oculares. Conheça a sua formação." />
<meta name="keywords" content="Dr. Gustavo Abreu, Doutor Gustavo Abreu, Dr. Gustavo Barbosa Abreu, Doutor Gustavo Barbosa Abreu, médico oftalmologista, médico doenças oculares, médico catarata, formação Dr. Gustavo Abreu, formação Doutor Gustavo Abreu, médico Penido Burnier." />

</head>
<body>
<%
Set rsTrabalhos = Server.CreateObject("ADODB.Recordset")
rsTrabalhos.Open "select * from "&prefixoTabela&"trabalhos where id="&id, Conexao
%>

	<section id="geral">
		
	<!--#include file="_includes/header.asp"-->
		<section id="corpo">

			<div class="margens">
				<span class="icone-azul livro" style="margin-right:10px"></span>
				<h2 class="t40 azul"><%=rsTrabalhos("titulo")%></h2>
				<div class="clearfix"></div>

				<%=rsTrabalhos("descricao")%>




			
			</div>
			
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>	
 	
</body>
</html>