** Variables ***
${CHROME_BROWSER}    Chrome
${IE_BROWSER}        ie
${FF_BROWSER}        ff
${BROWSER}           ${CHROME_BROWSER}
${ROOT}              http://192.168.189.72/joomla_build2/administrator/
${PERCY_TOKEN}       43d1e2ea6873f1ff5497ef7edd5ac6dae416dbb999a51ff2674516659d89ac88


*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    StringKeyword.py
Library    PercyClient2.py
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