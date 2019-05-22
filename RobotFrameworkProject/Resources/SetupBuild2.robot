** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${BROWSER}           ${CHROME_BROWSER}
${ROOT}              http://192.168.189.72/joomla_build2/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla_build2/
${USERNAME}          admin
${PASSWORD}          123456789
${PERCY_TOKEN}       2a81bae2315d300f4d8e7879ec69bc6f1b350f7b1b55e138ee430e3ba52f5be9

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    PercySetupBuild2.py
Library    Process

*** Keywords ***
Setup
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}

Teardown
    Close all browsers
    Percy Finalize Build