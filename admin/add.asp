<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexao.asp" -->
<!--#include file="valida.asp" -->

<%
tipo		= request.QueryString("tipo")

if tipo="1" then
'**********************************************
'  adiciona novo agendamento
'**********************************************


'captura as informações da página anterior'
id 			= request.form("txtId")
n 			= request.form("txtNumero")
diaSemana	= request.form("txtDiaSemana")
horario		= request.form("txtHorario")
nome 		= request.form("txtNome")
email		= request.form("txtEmail")
email2		= request.form("txtEmail2")
telefone	= request.form("txtTel")
endereco	= request.form("txtEnd")
sexo		= request.form("txtSexo")
atendimento	= request.form("txtAtendimento")

if nome="" then
	'marca o horário como livre'
	set updateRs=Server.CreateObject("ADODB.recordset")
	editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&n&"='s' WHERE id="&id
	updateRs.open editSQL, Conexao
	response.redirect("consultas.asp?st=erro")
end if

	'if email<>email2 or email="" or email2="" then
		'marca o horário como livre'
		'set updateRs=Server.CreateObject("ADODB.recordset")
		'editSQL = "UPDATE "&prefixoTabela&"reservas SET disp"&n&"='s' WHERE id="&id
		'updateRs.open editSQL, Conexao
		'response.redirect("consultas.asp?st=erro")
	'end if

'salva todos os dados na tabela correspondente ao ID'
set updateRs=Server.CreateObject("ADODB.recordset")
editSQL = "UPDATE "&prefixoTabela&"reservas SET nome"&n&"='"& nome &"', email"&n&"='"& email &"', telefone"&n&"='"& telefone &"', end"&n&"='"& endereco &"', sexo"&n&"='"& sexo &"', atendimento"&n&"='"& atendimento &"', confirma"&n&"='s', disp"&n&"='c' WHERE id="&id
updateRs.open editSQL, Conexao


if email<>"" then
	'*********************************************'
	'envia email de confirmação com cópia para ...'
	'*********************************************'

	' Cria os objetos para envio de e-mail
	Set message = Server.CreateObject("CDO.Message")
	Set conf = Server.CreateObject("CDO.Configuration")
	Set param = conf.Fields

	param("http://schemas.microsoft.com/cdo/configuration/sendusing")  = 2
	param("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	param.Update

		
		'Obtendo valores digitados no formul�rio e armazen�-los nas vari�veis locais
		strFrom		= "contato@drgustavo.com.br"
		strTo		= email
		'strTo		= "eduardofagnoni@gmail.com"
		strSubject	= "Agendamento"
		strNome		= nome
		strEmail	= "agendamento@drgustavo.com.br"
		'strArquivo	= filename
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
		Dim a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12



	a1="<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1' /></head><body><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>&nbsp;</td><td width='794'><table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td><img src='http://www.webox.com.br/clientes/drgustavo/images/email/topo.jpg'></td></tr><tr><td>"

	a2="<div style='-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;background-color:#EDEDED;padding:39px;'><p style='font-size:30px;font-family: 'Arial', sans-serif;color:#595959;'>Ol&aacute;, "& nome &",<br>voc&ecirc; tem uma consulta pr&eacute;-marcada com o Dr. Gustavo Abreu, conforme informa&ccedil;&otilde;es abaixo:</p><hr style='height:1px;border-bottom:solid 1px #ccc;border-top:none;border-left:none;border-right:none;'><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#A0A0A0;'>"& nome &"<br>"& email &"<br>"& telefone &"<br>"& endereco &"<br>"& sexo &"<br>"& atendimento &"<br></p>"

	a3="<p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'>"& diaSemana &"</p><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'>"& dia &"</p><p style='font-size:25px;font-family: 'Arial', sans-serif;color:#595959;'>"& horario &"</p><hr style='height:1px;border-bottom:solid 1px #ccc;border-top:none;border-left:none;border-right:none;'><p style='font-size:20px;font-family: 'Arial', sans-serif;color:#595959;'><b>Aguarde o contato telef&ocirc;nico do consult&oacute;rio confirmando a consulta.</b><br />Anote o endere&ccedil;o e o telefone. Em caso de altera&ccedil;&atilde;o, favor comunicar o m&eacute;dico com at&eacute; 24 horas de anteced&ecirc;ncia.</p>"

	a4="<p style='font-size:20px;font-family: 'Arial', sans-serif;color:#595959;'><span style='color:#97B700;'>(19) 3231-5119  -  3232.5866</span><br>Avenida Andrade Neves, 683<br>CEP 13013-161 - Campinas - SP</p><img src='http://www.webox.com.br/clientes/drgustavo/images/email/mapa.jpg'></div></td></tr><tr><td><p style='text-align:center;margin-top:10px;'><img src='http://www.webox.com.br/clientes/drgustavo/images/email/rodape.jpg'></p></td></tr></table></td><td>&nbsp;</td></tr></table></body></html>"



		message.HTMLBody = a1+a2+a3+a4

	if tipoDeConexao="noAr" then	
		' Envia a mensagem!
		message.send
	end if
	Set message = nothing
end if

response.redirect("consultas.asp")



elseif tipo="2" then
'**********************************************
'  inclui trabalho
'**********************************************

titulo = request.form("txtTitulo")
info = request.form("txtInfo")
descricao = request.form("txtDescricao")


set addRs=Server.CreateObject("ADODB.recordset")
addSQL = "INSERT INTO "&prefixoTabela&"trabalhos (titulo, info, descricao) values ('" & titulo & "','" & info & "','" & descricao & "')"
addRs.open addSQL, Conexao

response.redirect("lista.asp?tipo=2")





elseif tipo="3" then
'**********************************************
'  FAZ O UPLOAD DA IMAGEM
'**********************************************










elseif tipo="4" then
'**********************************************
'  FAZ O UPLOAD DA IMAGEM
'**********************************************



	
end if
%>
