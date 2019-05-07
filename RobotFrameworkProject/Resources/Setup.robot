*** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${ROOT}              http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla/
${USERNAME}          admin
${PASSWORD}          123456789


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String


*** Keywords ***
Setup    
    ${PATH_CHROME}=                   Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    ${PATH_IE}=                       Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/IEDriverServer.exe
    ${PATH_FF}=                       Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/geckodriver.exe
    
    Log To Console                    ${PATH_IE} 
    Append To Environment Variable    ${PATH_IE}        ${PATH_IE}
    Open browser                      ${ROOT}           ${IE_BROWSER}
    Maximize Browser Window
    
Teardown    
    Close all browsers