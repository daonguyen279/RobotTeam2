** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${BROWSER}           ${CHROME_BROWSER}
${ROOT}              http://192.168.189.72/joomla/administrator/
${CLIENT_ROOT}       http://192.168.189.72/joomla/
${USERNAME}          admin
${PASSWORD}          123456789
${PERCY_TOKEN}       d8162921be37f9dc5c8a707a721a37e905953ddb71df15ba4c9e98415fbc0560

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    RobotFrameworkPercy

*** Keywords ***
Setup
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Append To Environment Variable    PERCY_TOKEN         ${PERCY_TOKEN}
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build

Teardown
    Close all browsers
    Percy Finalize Build