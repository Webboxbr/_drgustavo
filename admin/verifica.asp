<!--#include file="conexao.asp" -->


<%
Login = request.Form("Login")
Senha = request.Form("Senha")

Set rsTemp = Server.CreateObject("ADODB.Recordset")
rsTemp.Open "select * from "&prefixoTabela&"usuarios order by id desc", Conexao

Do While Not rsTemp.EOF
	if Login = rsTemp("email") and Senha = rsTemp("senha") then
		session("logado")	 = "sim"
		session("id") 		 = rsTemp("id")
		session("user") 	 = rsTemp("nome")
		session("userEmail") = rsTemp("email")
		session("perfil") 	 = rsTemp("nivel")
		response.Redirect("admin.asp")
	end if
rsTemp.MoveNext
Loop
rsTemp.close

		session("logado") = "nao"
		'response.Redirect("erro.asp")
		
'*********************************
'   LEVA PARA A TELA DE LOGIN
'   E EXIBE UMA MSG DE ERRO
'*********************************		
response.Redirect("default.asp?err=v")		
'*********************************
'   LEVA PARA A TELA DE LOGIN
'   E EXIBE UMA MSG DE ERRO
'*********************************		
		
%>

