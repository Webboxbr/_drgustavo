<form id="frmContato" name="frmContato" method="post" action="emailCDO/dependencias/envia.asp">

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