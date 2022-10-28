*** Settings ***

#Libraries
Library  SeleniumLibrary

#Ressources
Resource  ../ressources/shared/authentification.robot
Resource  ../ressources/shared/close-browser.robot

#Tags
Default Tags  Création client

#Configs
Test Setup  Authentification  somei  Test123*
#Test Teardown  close-browser


*** Variables ***
#Client
${numClientRegroupant}  
${civilite}  MR
${nom}  Oumar
${prenom}  Moustapha
${dtNaiss}  25/10/1989
${lieuNaiss}  RABAT
${inactif}  "false"

#Adresse
${complement}
${voie}   RUE FICTIVE SECTEUR 12001
${btePostale}
${codePostal}  46000
${ville}  RABAT
${pays}  MAR  #Maroc

#Classiffication
${qualite}  R1  #Client particulier
${typeIdentification}  002  #Passeport
${numIdentification}  24AAAA4
${activite}  BN  #Banque
${natJuridique}  01  #Particulier
${catTiers}  01  #Personne physique
${codeApe}

#Relation
${agence}  37  #Agence siege
${telPrincipal}  21265548756
${telSecondaire}
${contactAutorise}  "false"
${email}  test10@gmail.com
${nbreExFacture}  1
${declassFacture}  "false"
${interditBancaire}  "false"

#recherche rapide
${valueRecherche}  ${nom} ${prenom}







*** Test Cases ***
Création du client
    #Remplissage du cadran Client
    click element  //*[@id="clientèle"]/a/i[2]
    click element  //*[@id="clientèleContent"]/li[1]/a
    click element  //i[contains(@class, "fa-user-plus")]
    input text  //*[@id="numeroclientregroupant"]  ${numClientRegroupant}
	Select From List By Value  id=titreclient  ${civilite} 
    input text  //*[@id="raisonsociale"]  ${nom}
    input text  //*[@id="prenom"]  ${prenom}
    input text  //*[@id="idDateNaissance"]  ${dtNaiss}
    input text  //*[@id="lieunaissance"]  ${lieuNaiss}
    IF  ${inactif}=="true"
        click element  //*[@id="inactif"]
    END
    
    #Remplissage du cadran Adresse
    input text  //*[@id="complement"]  ${complement}
    input text  //input[@name="adressepostaleadresse"]  ${voie}
    input text  //*[@id="codepostal"]  ${codePostal}
    input text  //*[@id="ville"]  ${ville}
    Select From List By Value  id=pays  ${pays}
        
    #Remplissage du cadran Classification
    Select From List By Value  id=qualite  ${qualite}
    Select From List By Value  id=typepieceidentification  ${typeIdentification}
    input text  //*[@id="pieceidentification"]  ${numIdentification}
    Select From List By Value  id=activitesectorielle  ${activite}
    Select From List By Value  id=naturejuridique  ${natJuridique}
    Select From List By Value  id=categorietiers  ${catTiers}

    #Remplissage du cadran Relation
    Select From List By Value  id=agence  ${agence}
    input text  //*[@id="telephoneprincipal"]  ${telPrincipal}
    input text  //*[@id="telephonesecondaire"]  ${telSecondaire}
    IF  ${contactAutorise}=="true"
        click element  //*[@id="indicateurautorisationcontact"]  
    END
    input text  //*[@id="email"]  ${email}
    input text  //*[@id="nombreexemplairesfactures"]  ${nbreExFacture}
    IF  ${contactAutorise}=="true"
        click element  //*[@id="indicateurautorisationcontact"]  
    END
    IF  ${interditBancaire}=="true"
        click element   //*[@id="indicateurinterditbancaire"] 
    END
    click element  //div[contains(@class, "buttons__inside")]/button[2]

Vérification de la création du client  
    Recherche Rapide  ${valueRecherche}
    


Modification du client créé
    Recherche Rapide  ${valueRecherche}
    click element  //a[contains(@class, "ng-isolate-scope")]
    click element  //div[contains(@class, "card-actions")]/ul/li/a
    Wait Until Element Is Visible  //li[contains(@class, "open")]/ul/li/a  
    click element  //li[contains(@class, "open")]/ul/li/a
    click element  //button[@class="btn-default btn-sm m-r-10"]


Suppression du client créé
    #Besoin du web service de suppression de client

      
    
    
    

    









*** Keywords ***
Recherche Rapide 
    [Documentation]  Cette fonction sert à faire la recherche rapide
    [Arguments]  ${valueRecherche}
    input text  //*[@id="searchfield"]  ${valueRecherche}
    click element  //*[@id="search"]
    wait until page contains element  //*[@id="search-results--active"]/div[2]/ul/li[2]/a
    click element  //*[@id="search-results--active"]/div[2]/ul/li[2]/a
    element should contain  //div[contains(@class, "page-title--left")]/h1  Synthèse client