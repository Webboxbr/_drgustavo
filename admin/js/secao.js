function apresentarHora(valor){
 		var minutos
 		var segundos
 		var janela
 				
 		if (valor<0) 
 			return ''
 		
 				
 		if (valor == 120) {
 			janela = window.open('aviso.html','janelaAviso','width=350,height=190,top=150,left=200')
 			janela.focus()
 		}
 				
 		//divide o valor por 60 para achar os minutos
 		minutos = parseInt(valor/60,10)
 		//pega a parte decimal e multiplica por 60 para achar os segundos
 		segundos = ( (valor/60) - minutos ) * 60
 		segundos = Math.round(segundos)
 			
 		if (minutos>1)
 			minutos = 'Faltam ' + minutos + ' minutos'
 		else
 			if (minutos == 1 )
 				minutos = 'Falta 1 minuto'
 			else
 				minutos = ''
 			
 		if (segundos>1)
 			if (minutos=='')
 				segundos = 'Faltam ' + segundos + ' segundos'
 			else
 				segundos = ' e ' + segundos + ' segundos'
 		else
 			if (segundos == 1 )
 				segundos = ' 1 segundos'
 			else
 				if (segundos==0)
 					segundos = ' e 0 segundos'
 			
 		return minutos + segundos + ' para expirar a sess&atilde;o'	
 	}
 		
 	var gIdIntervalo = null
 	
 	function reiniciarContadorSessao(){
 		var span = document.getElementById("contadorSessao")
 		var saida
 		span.innerHTML = ''
 		var valor = 900
 		
 		var funcao = function() { 
 			saida = apresentarHora(valor--)
 			if (saida=='') {
 				alert('Seu tempo de login terminou. Clique em "OK" para acessar novamente')
 				window.location.href='default.asp'
 				window.clearInterval(gIdIntervalo) 
 			}
 			else
 				span.innerHTML= saida
 				
 		}
 		window.clearInterval(gIdIntervalo) 
 
 		gIdIntervalo = window.setInterval ( funcao ,1000)
 	}