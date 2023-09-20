*** Settings ***

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Variables ***
${DECK_NAME}    Teste5

*** Keywords ***

Click NoItem Menu
    Wait Until Element Is Visible    xpath=//android.widget.ImageButton[@content-desc="Open drawer"]    timeout=20
    Click Element    xpath=//android.widget.ImageButton[@content-desc="Open drawer"]

Click no Botão Settings
    Click Element    id=com.ichi2.anki.debug:id/nav_settings 

Click no Botão Reviewing
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/recycler_view    timeout=5
    Click Element    xpath=//*[@resource-id='com.ichi2.anki.debug:id/recycler_view']/*[2]

Click no Switch Automatic Answer
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/switchWidget    timeout=5
    Click Element    id=com.ichi2.anki.debug:id/switchWidget 

Click no Botão Voltar
    Click Element    xpath=//*[@content-desc='Navigate up'] 

Verify Switch Is Enabled
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/switchWidget    timeout=5
    Should Be True    id=com.ichi2.anki.debug:id/switchWidget     The Switch is not enabled        

*** Test Cases ***
Configurar exibição automática de resposta
    Click NoItem Menu
    Click no Botão Settings
    Click no Botão Reviewing
    Click no Switch Automatic Answer
    Click no Botão Voltar
    Click no Botão Reviewing
