*** Settings ***
Library  SeleniumLibrary






*** Keywords ***
Authentification
    [Arguments]    ${username}  ${password}
    [Documentation]  Cette fonction permet de se connecter à Waterp Web
    Log To Console  Le test a démarré
    Open Browser  https://wrp-mrc-nightly.somei.fr/  chrome
    Maximize Browser Window  
    Input Text          //input[@id="username"]  ${username}
    Input Password  id=password  ${password}
    Click Element       //button[@class="waves-effect waves-light btn btn-somei ng-binding"]
    
    

