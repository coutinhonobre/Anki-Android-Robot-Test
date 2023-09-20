*** Settings ***

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Variables ***
${DECK_NAME}    Teste

*** Keywords ***
Insira Texto No Campo de Mensagem
    [Arguments]    ${texto}
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/md_input_message    timeout=20
    Input Text    id=com.ichi2.anki.debug:id/md_input_message    ${texto}

Verifique Se O Item De Lista Foi Criado
    [Arguments]    ${nome_esperado}
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/deckpicker_name    timeout=20
    ${nome_atual}=    Get Text    id=com.ichi2.anki.debug:id/deckpicker_name
    Should Be Equal    ${nome_atual}    ${nome_esperado}    


*** Test Cases ***
Deve Adicionar Um Novo Baralho
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/fab_main    timeout=20
    Click Element    id=com.ichi2.anki.debug:id/fab_main
    Wait Until Element Is Visible    id=com.ichi2.anki.debug:id/add_deck_action    timeout=20
    Click Element    id=com.ichi2.anki.debug:id/add_deck_action
    Insira Texto No Campo de Mensagem    ${DECK_NAME}
    Click Element    id=com.ichi2.anki.debug:id/md_button_positive
    Verifique Se O Item De Lista Foi Criado    ${DECK_NAME}
