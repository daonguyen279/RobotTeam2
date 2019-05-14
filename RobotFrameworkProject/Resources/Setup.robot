*** Variables ***
${BROWSER}        Chrome
${ROOT}           http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}    http://192.168.189.72/joomla/
${USERNAME}       admin
${PASSWORD}       123456789


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    pabot.PabotLib
Library    hihi.py
Library    ex3.py


*** Keywords ***
Setup    
    ${PATH}=                          Normalize Path    path	     /RobotTeam2/RobotFrameworkProject/Resources/chromedriver.exe
    Log To Console                    ${PATH}   
    Append To Environment Variable    ${PATH}           ${PATH}
    Open browser                      ${ROOT}           ${BROWSER}
    Maximize Browser Window
    
Teardown    
    Close all browsers