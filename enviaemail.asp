<%
nome		=	request.form("txtNome")
telefone	=	request.form("txtTelefone")
email		=	request.form("txtEmail")
msg			=	request.form("txtMsg")

' Cria os objetos para envio de e-mail
Set message = Server.CreateObject("CDO.Message")
Set conf = Server.CreateObject("CDO.Configuration")
Set param = conf.Fields

param("http://schemas.microsoft.com/cdo/configuration/sendusing")  = 2
param("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
param.Update

	
	'Obtendo valores digitados no formul�rio e armazen�-los nas vari�veis locais
	strFrom		= "contato@drgustavoabreu.com.br"
	strTo		= "ga@drgustavoabreu.com.br"
	'strTo		= "eduardofagnoni@gmail.com"
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
	message.Bcc = "eduardo@webbox.com.br"
	message.To = strTo
	message.Subject  = strSubject
	
	
	'Monta a Msg
	Dim a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12


a1 = "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /><title></title></head><body><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>&nbsp;</td><td width='600'><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>Nome: "& strNome &"</td></tr><tr><td>E-mail: "& strEmail &"</td></tr><tr><td>Telefone: "& strTelefone &"</td></tr><tr><td>Mensagem: </td></tr><tr><td>"& strMsg &"</td></tr></table></td><td>&nbsp;</td></tr></table></body></html>"

	message.HTMLBody = a1

if tipoDeConexao="noAr" then	
	' Envia a mensagem!
	message.send
	Set message = nothing
end if

response.Redirect("contato_confirma.asp")

%>