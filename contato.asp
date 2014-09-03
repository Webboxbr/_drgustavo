<!DOCTYPE HTML>
<html lang="pt-br">
<head>
 	<meta charset="UTF-8">
 	<script type="text/javascript" src="js/modernize.js"></script>
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="emailCDO/dependencias/styleForm.css">

<title>Dr. Gustavo Abreu | Oftalmologista – contato</title>
<meta name="author" content="Webbox" />
<meta name="description" content="Para entrar em contato com o Médico Oftalmologista Dr. Gustavo Abreu, ligue (19) 3231.5119 / 3232.5866 ou preencha o formulário da página." />
<meta name="keywords" content="Contato Dr. Gustavo Abreu, oftalmologista contato, telefone Dr. Gustavo Abreu, endereço Dr. Gustavo Abreu, localização Dr. Gustavo Abreu." />

</head>
<body>

	<section id="geral">
		
	<!--#include file="_includes/header.asp"-->
		<section id="corpo" class="corpo-contato">

			<div class="margens">

				<div class="desloca-esq" style="width:540px;">
					<span class="icone-azul contato" style="margin-right:10px"></span>
					<h2 class="t40 azul" style="margin-top:0;">Contato</h2>
					<div class="clearfix"></div>

					<p class="cinza">Para entrar em contato com o Dr. Gustavo Abreu, preencha o formulário e clique em enviar.</p>

						<form id="frmContato" name="frmContato" method="post" action="enviaemail.asp">

						    <label for="txtNome">Seu Nome:</label>
						    <input type="text" name="txtNome" placeholder="Seu Nome:">
						    
						    <label for="txtTelefone">Seu Telefone:</label>
						    <input type="tel" name="txtTelefone" placeholder="Seu Telefone:">

								<label for="txtEmail">Seu e-mail:</label>
						  	<input type="email" name="txtEmail" placeholder="Seu e-mail:">
						    
						    <label for="txtMsg">Sua mensagem:</label>
						    <textarea name="txtMsg" placeholder="Sua mensagem:"></textarea>
						    
						    <div><input type="image" src="images/botEnviar.jpg" name="button" id="button"></div>

						</form>


				</div>
				<div class="desloca-dir" style="width:540px;">
					<span class="icone-verde localizacao"></span>
					<h2 class="contato-dir verde">Localização</h2>
					<p class="contato-dir cinza-claro">do Consultório</p>
					<div class="clearfix"></div>


					<p class="cinza"><span class="verde">XX (19) 3231-5119  -  3232.5866</span><br>
					Avenida Andrade Neves, 683<br>
					CEP 13013-161 - Campinas - SP</p>

					<iframe width="538" height="411" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/ms?msa=0&amp;msid=211801331599896846726.0004fbfae0a334bc75abf&amp;hl=pt-BR&amp;ie=UTF8&amp;t=m&amp;ll=-22.902714,-47.070032&amp;spn=0.004062,0.005761&amp;z=17&amp;output=embed"></iframe>

				</div>				
				<div class="clearfix"></div>

			</div>
			
		</section>
		<!--#include file="_includes/footer.asp"-->
	</section>	
 	
</body>
</html>