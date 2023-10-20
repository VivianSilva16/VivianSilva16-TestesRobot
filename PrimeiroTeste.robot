*** Settings ***
Library   SeleniumLibrary     # Biblioteca que será utilizada 
Library    FakerLibrary   locale=pt_BR    # criando pessoinhas de mentira para os testes  
Resource  Setup_teardown.robot   # Este é o padrão que a gente chama no arquivo criado para repetir em todos os testes 
Test Setup      Dado que eu acesse o Organo  #palavra chave para testar o setup 
Test Teardown   Fechar o Navegador  

*** Variables ***
${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]


*** Test Cases ***
Verificar se ao preencher corretamente o formulário os dados são inseridos corretamente na lista e se um novo card é criado no time esperado 
   
    
    Dado que eu preencha os campos do formulario 
    E clique no botão criar card  # eu espero que 
    Então identificar o card dentro do time esperado   # JA ESTAMOS NO BDD


Verificar se é possível criar mais de um card se preenchermos os campos corretamente
      
      Dado que eu preencha os campos do formulario      #primeiro precisa criar os cards pra depois verificar 
      E clique no botão criar card 
      Então identificar 3 cards no time esperado




*** Keywords ***  # palavras chave 

Dado que eu preencha os campos do formulario

Dado que eu preencha os campos do formulário     #variaveis de pessoa aleatoria gerada pela biblioteca 
    ${Nome}             FakerLibrary.First Name
    Input Text          ${CAMPO_NOME}        ${Nome}
    ${Cargo}            FakerLibrary.Job
    Input Text          ${CAMPO_CARGO}      ${Cargo}
    ${Imagem}           FakerLibrary.Image Url
    Input Text          ${CAMPO_IMAGEM}     ${Imagem}
    Click Element       ${CAMPO_TIME}
    Click Element       ${PROGRAMACAO}
    
    # código omitido
E clique no botão criar card  # eu espero que

      
    Click Element  ${BOTAO_CARD}  #id:form-botao 

Então identificar o card dentro do time esperado   # JA ESTAMOS NO BDD
 
    Element Should Be Visible   class:colaborador   # aqui e pra voce saber se aquele card que voce submeteu no formulario vai estar visivel 
     Sleep     5s 

Então identificar 3 cards no time esperado

   FOR    ${i}    IN RANGE    1   3      #LAÇO DE REPETIÇÃO
       
       Dado que eu preencha os campos do formulario
       E clique no botão criar card

   END

   Sleep    10s