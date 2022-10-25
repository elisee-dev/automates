*** Settings ***
Library    ExcelLibrary


*** Variables ***
${liste}=  ['h', 'e', 'l', 'l', 'o']

*** Test Cases ***
Open Excel and perform Operation 
    Open Excel Document  C:/Users/Elisée Konan/Desktop/Robot/AutomateTests/W/ressources/Docs/JD.xlsx    True  
 
    # Reading number of Rows in Excel Sheet
    
     
     FOR    ${index}    IN RANGE    0    10 
        ${strRowCount}=  Read Excel Row  ${index}
        Log To Console  \nCols are => ${strRowCount}[0] / ${strRowCount}[1]  
    END
    ${sheets}=  Get List Sheet Names
    
    FOR  ${item}  IN  ${sheets}
        Log To Console  ${item}
    
    END
   			
    Create Excel Document  doc_id=test
    Write Excel Cell  row_num=2  col_num=1  value=text  sheet_name=Sheet
    
    Write Excel Column  col_num=4  col_data=${liste}   row_offset=1  sheet_name=Sheet
    Save Excel Document  filename=ressources/file.xlsx
    Close Current Excel Document
      
    	
    
    
    
    