<%
nome		=	request.QueryString("txtNome")
telefone	=	request.QueryString("txtTelefone")
email		=	request.QueryString("txtEmail")
msg			=	request.QueryString("txtMsg")

' Cria os objetos para envio de e-mail
Set message = Server.CreateObject("CDO.Message")
Set conf = Server.CreateObject("CDO.Configuration")
Set param = conf.Fields

param("http://schemas.microsoft.com/cdo/configuration/sendusing")  = 2
param("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
param.Update

	
	'Obtendo valores digitados no formul�rio e armazen�-los nas vari�veis locais
	strFrom		= "contato@3albe.com.br"
	'strTo		= "ga@drgustavoabreu.com.br"
	strTo		= "eduardofagnoni@gmail.com"
	strSubject	= "Contato Dr. Gustavo Abreu"
	strNome		= nome
	strTelefone	= telefone
	strEmail	= email
	strMsg		= msg
	
	'Verifica campos obrigatórios
	'if strNome="" or strEmail="" or strMsg="" then
	'response.Redirect("contatoErro.asp?erro=camposObrigatorios")
	'end if
	
	'Retira caracteres inv�lidos que possam ser inclusos por acesso n�o autorizado
	'para envio de Spam
	aux1 = chr(13)
	aux2 = chr(10)
	regex= " | |cc:|bcc:|"& aux1 &"|"& aux2
	Set objRegExp = New RegExp
	objRegExp.Pattern = regex
	objRegExp.IgnoreCase = True
	objRegExp.Global = True
	
	strFrom = objRegExp.Replace(strFrom,"")
	strTo = objRegExp.Replace(strTo,"")
	'strSubject = objRegExp.Replace(strSubject,"")
	
	Set message.configuration = conf
	'Atribui-se os valores para as propriedades do objeto
	message.From = strFrom
	message.Bcc = ""
	message.To = strTo
	message.Subject  = strSubject
	
	
	'Monta a Msg
	%>
	<!--#include file="template_default.asp"-->
	<%

	message.HTMLBody = a1

if tipoDeConexao="noAr" then	
	' Envia a mensagem!
	message.send
	Set message = nothing
end if

response.Redirect("../../contato_confirma.asp")

%>