*** Variables ***
${BROWSER}    Chrome
<<<<<<< HEAD
${ROOT}       http://192.168.189.72/joomla/administrator
=======
${ROOT}       http://192.168.189.72/joomla/administrator/ 
>>>>>>> 4344d3138b4ed3ebd742101e3d82316ca2845e67


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
   

*** Keywords ***
Setup    
    ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    Log To Console                    ${PATH}   
    Append To Environment Variable    ${PATH}           ${PATH}
    Open browser                      ${ROOT}           ${BROWSER}
    Maximize Browser Window

Teardown    
    Close all browsers
