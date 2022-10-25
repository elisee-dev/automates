*** Settings ***				
Library	JSONLibrary	



* Test Cases *				
TestManipulatingJSON				
    ${json_object}=	Load JSON From File	example.json		
    Log To Console  ${json_object}[0][nom]	