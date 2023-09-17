*** Settings ***
| Library | AppiumLibrary | run_on_failure=AppiumLibrary.CapturePageScreenshot
Documentation     Teste para adicionar um novo baralho no AnkiDroid
Library     AppiumLibrary


*** Keywords ***
Aceitar Permissao de Disco
    Wait Until Element Is Visible    id=com.android.packageinstaller:id/permission_allow_button    timeout=20
    Click Element    id=com.android.packageinstaller:id/permission_allow_button

Get Started
    Click Element    id=com.ichi2.anki.debug:id/get_started
    Aceitar Permissao de Disco
    
Open Session
    Open Application    http://localhost:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 app=/Users/coutinhonobre/AndroidStudioProjects/Anki-Robot-Test/app/AnkiDroid-full-x86-debug.apk
    ...                 udid=emulator-5554
    ...                 appPackage=com.ichi2.anki.debug
    ...                 appActivity=com.ichi2.anki.IntroductionActivity
    Get Started

Close Session
    Close All Applications