*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary


Default Tags  Supervision des encaissements

Resource  ../ressources/shared/authentification.robot
Resource  ../ressources/shared/close-browser.robot 

Test Setup  Authentification  somei  Test123*
Test Teardown  close-browser






*** Variables ***





*** Test Cases ***

TC1
    [Tags]  Affichage de toutes les sessions de caisse 
    
    click Element  //*[@id="recouvrement"]/a
    Wait Until Element Is Visible  //*[@id="recouvrementContent"]/li[5]/a
    click Element  //*[@id="recouvrementContent"]/li[5]/a
    click Element  //*[@id="behind-filter"]/div[2]/div[5]/div/label/input
    click Element  //*[contains(text(), "entre le")]
    click Element  //*[contains(text(), "Different de")]
    click Element  //span[contains(@class, "k-i-calendar")]
    input text  //input[@value="25/10/2022"]  20/10/2022
    click Element  //*[@id="rechercher"]
    
    
    
   
    
    
    
    









*** Keywords ***
