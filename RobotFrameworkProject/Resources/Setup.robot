** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${BROWSER}           ${CHROME_BROWSER}
${ROOT}              http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla/
${USERNAME}          admin
${PASSWORD}          123456789
${PERCY_TOKEN}       fc038fae1c1cb91c7c84c11dcc823d1fe8bbcdbb03fe6252fc1e48f64c7c7f4e

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    PercyClient.py
Library    Process

*** Keywords ***
Setup
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}

Teardown
    Run process      robot --listener allure_robotframework C:/robot/RobotTeam2/RobotFrameworkProject/Tests/VisualTests
    Run process      allure serve C:/robot/RobotTeam2/output/allure
    Close all browsers
    Percy Finalize Build