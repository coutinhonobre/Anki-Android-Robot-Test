*** Settings ***

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Variables ***
${DECK_NAME}    Teste4
${EMAIL}        coutinhonobre360@gmail.com
${PASSWORD}     12345678

*** Keywords ***
Verifique Se O Item De Lista Foi Criado
    Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Hi"]    timeout=5
    Page Should Contain Element    xpath=//android.view.View[@content-desc="Hi"]

Click no Menu Sync
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/action_sync    timeout=5
    Click Element    id=com.ichi2.anki.debug:id/action_sync

Click no Log in do Dialog or Continue
    Wait Until Element Is Visible    id=android:id/button1    timeout=2
    Click Element    id=android:id/button1    

Click no Botao Log in
    Click Element    id=com.ichi2.anki.debug:id/login_button    

Insira Email No Campo de Email address
    [Arguments]    ${texto}
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/username    timeout=5
    Input Text    id=com.ichi2.anki.debug:id/username    ${texto} 

Insira Senha No Campo de Password
    [Arguments]    ${texto}
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/password    timeout=2
    Input Text    id=com.ichi2.anki.debug:id/password    ${texto}         


*** Test Cases ***
Deve Sincronizar baralhos com a conta AnkiWeb
    Click no Menu Sync
    Click no Log in do Dialog or Continue
    Insira Email No Campo de Email address    ${EMAIL}
    Insira Senha No Campo de Password    ${PASSWORD}
    Click no Botao Log in
    Click no Menu Sync
    Click no Log in do Dialog or Continue

