*** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${PERCY_TOKEN}       fc038fae1c1cb91c7c84c11dcc823d1fe8bbcdbb03fe6252fc1e48f64c7c7f4e
${ROOT}              http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla/
${USERNAME}          admin
${PASSWORD}          123456789


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    PercyClient.py


*** Keywords ***
Setup    

    ${PATH_CHROME}=                   Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    ${PATH_IE}=                       Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/IEDriverServer.exe
    ${PATH_FF}=                       Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/geckodriver.exe
    
    Log To Console                    ${PATH_CHROME} 
    Append To Environment Variable    ${PATH_CHROME}        ${PATH_CHROME}
    Append To Environment Variable    ${PERCY_TOKEN}        ${PERCY_TOKEN}
    Open browser                      ${ROOT}           ${CHROME_BROWSER}
    ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    # ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/geckodriver.exe
    # ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/IEDriverServer.exe
    Maximize Browser Window
    # Percy Init                        
    
Teardown    
    Close all browsers