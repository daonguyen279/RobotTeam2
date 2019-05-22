<<<<<<< HEAD
*** Variables ***
${BROWSER}        Chrome
${ROOT}           http://192.168.189.72/joomla_build2/administrator
${CLIENT_ROOT}    http://192.168.189.72/joomla_build2
${USERNAME}       admin
${PASSWORD}       123456789
${PERCY_TOKEN}    518352dedc4c11d15182e17d5a687992a4cba7777fd4c8fb4fa5ae42ce13a4f0

=======
** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${BROWSER}           ${CHROME_BROWSER}
${ROOT}              http://192.168.189.72/joomla_build2/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla_build2/
${USERNAME}          admin
${PASSWORD}          123456789
${PERCY_TOKEN}       fc038fae1c1cb91c7c84c11dcc823d1fe8bbcdbb03fe6252fc1e48f64c7c7f4e
>>>>>>> percy

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
<<<<<<< HEAD
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
=======
Library    PercyClient.py

*** Keywords ***
Setup
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}

Teardown
>>>>>>> percy
    Close all browsers
    Percy Finalize Build