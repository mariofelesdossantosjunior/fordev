Feature: Login
  Como um cliente
  Quero poder acessar minha conta e me manter logado
  Para que eu possa ver e responder enquetes de forma rapida

  Scenario: Credenciais Validas
  Dado que o cliente informou credenciais validas
  Quando solicitar para fazer login
  Então o sistema deve enviar o usuário para a tela de pesquisas
  E manter o usuário conectado

  Scenario: Crendenciais Invalidas
  Dado que o cliente informou credenciais invalidas
  Quando solicitar para fazer login
  Então o sistema deve retornar uma mensagem de erro