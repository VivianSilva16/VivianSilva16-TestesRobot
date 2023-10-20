*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.tiktok.com/
${USERNAME}       @viviansilva_26
${PASSWORD}       Frodo.sam21s

*** Test Cases ***
Login to TikTok Web
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//button[@class="jsx-1423397268"]
    Input Text    xpath=//input[@name="email"]    ${USERNAME}
    Input Text    xpath=//input[@name="password"]    ${PASSWORD}
    Click Element    xpath=//button[@type="Entrar"]
    # Adicione verificações ou outros passos necessários

*** Keywords ***
Cleanup
    Close Browser