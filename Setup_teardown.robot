*** Settings ***

Library          SeleniumLibrary

#Keywords que vão ser o padrão BDD de todos os nossos testes 
#Você está definindo um comportamento que vai acontecer em todos os testes para acontecer de maneira padrão 
#Por exemplo: todos os testes abre e fecha bronswer dai nao faz sentido ficar escrevendo toda hora isso

*** Keywords ***

 Dado que eu acesse o Organo 

       Open Browser   url=http://localhost:3000/    browser=Chrome

Fechar o Navegador 

      Close Browser

