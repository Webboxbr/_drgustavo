<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="admin/conexao.asp" -->

<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">

<title>Dr. Gustavo Abreu | Oftalmologista – trabalhos e livros</title>
<meta name="author" content="Webbox" />
<meta name="description" content="O Médico Dr. Gustavo Abreu é autor de diversos  trabalhos e livros relacionados à Oftalmologia. Confira os principais." />
<meta name="keywords" content="Trabalhos Dr. Gustavo Abreu, livros Dr. Gustavo Abreu, trabalhos oftalmologia, livros oftalmologia, catarata, uveíte, varizes  orbitária, cirurgia refrativa, tratamento  cegueira, deslocamento  retina, neurite, lentes intra-oculares, Usher, válvula Ahmed, glaucoma, conjuntivite, cirurgia  miopia." />

</head>
<body>

	<section id="geral">
		
	<!--#include file="_includes/header.asp"-->
		<section id="corpo">

			<div class="margens">			

				
				<div class="desloca-esq" style="width:727px;padding-right:20px; border-right:solid 1px #EDEDED">
					<div style="height:30px;"></div>
					<span class="icone-azul livro" style="margin-right:10px"></span>
					<h2 class="t40 azul" style="margin-top:0;">Trabalhos</h2>
					<div class="clearfix"></div>
					<div style="height:30px;"></div>
					<ul>

<%
Set rsTrabalhos = Server.CreateObject("ADODB.Recordset")
rsTrabalhos.Open "select * from "&prefixoTabela&"trabalhos where ativa<>'n' order by id asc", Conexao

while not rsTrabalhos.eof
%>
	<li class="botao" onclick="location.href='trabalhos_interna.asp?id=<%=rsTrabalhos("id")%>'"><%=rsTrabalhos("titulo")%>
	<span><%=rsTrabalhos("info")%></span></li>
<%
rsTrabalhos.MoveNext()
wend

rsTrabalhos.Close()
set rsTrabalhos = nothing
Conexao.Close()
%>																
					</ul>					
				</div>


				<div class="desloca-dir corpo-livros" style="width:372px;" >
					<div style="height:30px;"></div>
					<span class="icone-azul livro" style="margin-right:10px"></span>
					<h2 class="t40 azul" style="margin-top:0;">Livros</h2>
					<div class="clearfix"></div>
					<div style="height:30px;"></div>
					
					<img src="images/livros/1.jpg" alt="" class="lv">
					<p class="lv">Autor: Dr. Gustavo Abreu Ultra-Sonografia Ocular 4ª edição.</p>
					<hr>

					<img src="images/livros/3.jpg" alt="" class="lv">
					<p class="lv">Co-autor: Dr. Gustavo Abreu Master Thechniques in Cataract and Refractive Surgery</p>
					<hr>

					<img src="images/livros/5.jpg" alt="" class="lv">
					<p class="lv">Co-autor: Dr. Gustavo Abreu <b>Fotocoagulação Ocular.</b> 1ª edição.</p>
					<hr>

					<!--
					<img src="images/livros/2.jpg" alt="" class="lv">
					<p class="lv">Co-autor: Dr. Gustavo Abreu Ultra-Sonografia Ocular: atlas & texto. 3ª edição.</p>
					<hr>
					-->

					

					<img src="images/livros/4.jpg" alt="" class="lv">
					<p class="lv">Co-autor: Dr. Gustavo Abreu Ecografia Ocular e Orbitária. Volume VI.</p>
					
					<div class="clearfix"></div>


					<div style="height:80px;"></div>
					<span class="icone-verde visao" style="margin-right:10px"></span>
					<h2 class="t30 verde" style="margin-top:-5px;">Certificados de especialização</h2>
					<div class="clearfix"></div>
					<div style="height:30px;"></div>

					<img src="images/certificados/1.jpg" alt="" class="cert">
					<p class="cert"><span class="negrito">Diploma de Mestre Editor</span> XXIX Simpósio da Associação Paranaense de Oftamologia</p>

					<img src="images/certificados/2.jpg" alt="" class="cert">
					<p class="cert"><span class="negrito">Diploma de Mérito Médico</span> pelos serviços prestados a Campinas no campo da medicina</p>

					<img src="images/certificados/3.jpg" alt="" class="cert">
					<p class="cert"><span class="negrito">Diploma de Membro Titular</span> - Sociedade Brasileira de Retina e Vítreo</p>

					<img src="images/certificados/4.jpg" alt="" class="cert">
					<p class="cert">Curso Panamericano de Oftalmologia del Cono Sur</p>

					<img src="images/certificados/5.jpg" alt="" class="cert">
					<p class="cert"><span class="negrito">Miembro Asociado</span> - Asociación Latinoamericana de Cirujanos de Catarata y Segmento Anterior</p>


				</div>
				<div class="clearfix"></div>

				



			</div>
			
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>	
 	
</body>
</html>