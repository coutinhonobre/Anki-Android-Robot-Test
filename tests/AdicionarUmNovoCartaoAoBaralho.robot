*** Settings ***

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Variables ***
${DECK_NAME}    Teste2

*** Keywords ***
Verifique Se O Item De Lista Foi Criado
    Wait Until Element Is Visible    xpath=//android.view.View[@content-desc="Hi"]    timeout=5
    Page Should Contain Element    xpath=//android.view.View[@content-desc="Hi"]

Insira Texto No Campo de Mensagem
    [Arguments]    ${texto}
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/md_input_message    timeout=20
    Input Text    id=com.ichi2.anki.debug:id/md_input_message    ${texto}

Insira Texto No Campo Front
    [Arguments]    ${texto}
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="Front"]    timeout=20
    Input Text    xpath=//android.widget.EditText[@content-desc="Front"]    ${texto}    

Insira Texto No Campo Back
    [Arguments]    ${texto}
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="Back"]    timeout=20
    Input Text    xpath=//android.widget.EditText[@content-desc="Back"]    ${texto}     

Click NoItem De Lista Foi Que Criado
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/deckpicker_name    timeout=20
    Click Element    xpath=//*[@resource-id='com.ichi2.anki.debug:id/deckpicker_name' and @text='Teste2']

ClickLong NoItem De Lista Foi Que Criado
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/deckpicker_name    timeout=20
    Long Press      xpath=//*[@resource-id='com.ichi2.anki.debug:id/deckpicker_name' and @text='Teste2']

Click no Botão Add
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/md_recyclerview_content    timeout=5
    Click Element    xpath=//*[@resource-id='com.ichi2.anki.debug:id/md_recyclerview_content']/*[1]

Click no Botão Save
    Click Element    id=com.ichi2.anki.debug:id/action_save 

Click no Botão Voltar
    Click Element    xpath=//*[@content-desc='Navigate up']


*** Test Cases ***
Deve Adicionar um novo cartão ao baralho
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/fab_main    timeout=20
    Click Element    id=com.ichi2.anki.debug:id/fab_main
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/add_deck_action    timeout=20
    Click Element    id=com.ichi2.anki.debug:id/add_deck_action
    Insira Texto No Campo de Mensagem    ${DECK_NAME}
    Click Element    id=com.ichi2.anki.debug:id/md_button_positive
    ClickLong NoItem De Lista Foi Que Criado
    Click no Botão Add
    Insira Texto No Campo Front    Hi
    Insira Texto No Campo Back    Oi
    Click no Botão Save
    Click no Botão Voltar
    Click NoItem De Lista Foi Que Criado
    Verifique Se O Item De Lista Foi Criado