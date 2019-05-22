
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
>>>>>>> percy

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    PercyClient.py
Library    StringKeyword.py
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