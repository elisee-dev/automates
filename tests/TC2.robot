*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  Collections





*** Variables ***
${url}  https://www.boredapi.com/







*** Test Cases ***
TC2
    [Tags]  Requete Get
    Create Session  Obtenir les items  ${url}
    ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json    charset=utf-8
    ${reponse}=  GET On Session  Obtenir les items  /api/activity  headers=${headers}
    Status Should Be  200

    
    Log To Console  ${reponse.json()} 
    
    
     

    

   









*** Keywords ***