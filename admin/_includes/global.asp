<%
'*********************************************************************************



'*********************************************************************************

tipoDeConexao			=	"local" ' variação - local ou noAr
tituloHome				=	""
caminho					=	""
prefixoTabela			=	""


if tipoDeConexao="noAr" then
upArquivo				=	""
upFoto					=	""
enderecoFoto			=	""
enderecoDocumento		=	""
enderecoArquivo			=	""
elseif tipoDeConexao="local" then
upArquivo				=	""
upFoto					=	""
enderecoFoto			=	""
enderecoDocumento		=	""
enderecoArquivo			=	""
else
	response.Write("Verifique o arquivo Global e veja as configurações em 'tipoDeConexao'")
end if

%>


