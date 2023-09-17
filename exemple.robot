*** Settings ***
| Library | AppiumLibrary | run_on_failure=AppiumLibrary.CapturePageScreenshot
Documentation     Teste para adicionar um novo baralho no AnkiDroid
Library     AppiumLibrary


*** Keywords ***
Iniciar Aplicativo AnkiDroid
    Open Application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 app=/Users/coutinhonobre/AndroidStudioProjects/Anki-Robot-Test/app/AnkiDroid-full-x86-debug.apk
    ...                 udid=emulator-5554
    ...                 appPackage=com.ichi2.anki.debug
    ...                 appActivity=com.ichi2.anki.IntroductionActivity

Aceitar Permissao de Disco
    Wait Until Element Is Visible    id=com.android.packageinstaller:id/permission_allow_button    timeout=20
    Click Element    id=com.android.packageinstaller:id/permission_allow_button

Passar Pela Tela Inicial
    # Supondo que haja um botão "Começar" ou "Iniciar" na tela inicial
    Click Element    id=com.ichi2.anki.debug:id/get_started
    Aceitar Permissao de Disco
    #Click Element    xpath=//com.google.android.material.button.MaterialButton[@text='Get Started']
    # Aqui você pode adicionar mais etapas conforme as telas e prompts que aparecem na primeira execução

*** Test Cases ***
Teste Primeira Execução
    Iniciar Aplicativo AnkiDroid
    Passar Pela Tela Inicial
    # Aqui você pode adicionar mais etapas para verificar outras funcionalidades após passar pela tela inicial
    Close Application

