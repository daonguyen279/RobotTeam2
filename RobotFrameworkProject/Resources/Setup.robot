*** Variables ***
${BROWSER}        Chrome
${ROOT}           http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}    http://192.168.189.72/joomla/
${USERNAME}       admin
${PASSWORD}       123456789
${PERCY_TOKEN}    2a81bae2315d300f4d8e7879ec69bc6f1b350f7b1b55e138ee430e3ba52f5be9


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    exam1.py
Library    StringKeyword.py
# Library    src.main.java.Tests.RobotTeam2.Demo
Library    PercySetup.py



*** Keywords ***
Setup
    ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    # ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/geckodriver.exe
    # ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/IEDriverServer.exe
    Log To Console                    ${PATH}   
    Append To Environment Variable    ${PATH}           ${PATH}
    Open browser                      ${ROOT}           ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}
    
Teardown    
    Close all browsers
    Percy Finalize Build