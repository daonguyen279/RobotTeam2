*** Variables ***
${BROWSER}        Chrome
${ROOT}           http://192.168.189.72/joomla/administrator/
${ROOT_2}         http://localhost/joomla/administrator/
${CLIENT_ROOT}    http://192.168.189.72/joomla/
${USERNAME}       admin
${PASSWORD}       123456789
${PERCY_TOKEN}    863f351e4a075939b1e1e8e0e03aa78386336962c4d1405cd2a8469405c1f6ef

*** Settings ***
Library    Selenium2Library
Library    OperatingSystem
Library    PageObjectLibrary
Library    String
Library    pabot.PabotLib
Library    Percy.py

*** Keywords ***
Setup    
    Append To Environment Variable    PATH                ${CURDIR}/Drivers
    Open browser                      ${ROOT}             ${BROWSER}
    Maximize Browser Window
    Percy Initialize Build            ${PERCY_TOKEN}
    
Teardown    
    Close all browsers
    Percy Finalize Build