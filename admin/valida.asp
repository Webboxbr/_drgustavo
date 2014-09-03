<%
if session("logado") <> "sim" then
	response.Redirect("default.asp")
end if	
%>